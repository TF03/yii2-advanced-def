<?php

namespace frontend\helper;

use frontend\models\Accounts;
use frontend\models\Transaction;
use yii;
use yii\helpers\Html;
use common\models\Transaction2Category;
use frontend\models\Category;

class TransactionHelper extends BaseHelper
{
    const TYPE_INCOME = 1;
    const TYPE_EXPENSE = 2;

    const FOR_DATE_NOW = 'now';
    const FOR_DATE_YESTERDAY = 'yesterday';

    protected static $beautyStringForDate = [
        self::FOR_DATE_NOW => 'Сегодня',
        self::FOR_DATE_YESTERDAY => 'Вчера'
    ];

    protected static $listNames = [
        self::TYPE_INCOME => 'Доход',
        self::TYPE_EXPENSE => 'Расход'
    ];

    protected static $listClasses = [
        self::TYPE_INCOME => 'type-income',
        self::TYPE_EXPENSE => 'type-expense'
    ];

    /**
     * @param $key
     * @return mixed
     */
    public static function getClassesForType($key)
    {
        $aStatus = static::getValues(self::$listClasses);

        return isset($aStatus[$key]) ? $aStatus[$key] : $key;
    }

    public static function getTypesWithKey()
    {
        return [
            'income' => self::TYPE_INCOME,
            'expense' => self::TYPE_EXPENSE
        ];
    }

    /**
     * @param $key
     * @return mixed
     */
    public static function getTypeByKey($key)
    {
        $key = strtolower($key);
        $types = static::getTypesWithKey();

        return isset($types[$key]) ? $types[$key] : null;
    }

    /**
     * @return array
     */
    public static function getListTransaction()
    {
        $result = [];

        $categories = Category::findActual()->all();
        if (isset($categories)) {
            foreach ($categories as $category) {
                /** @var $category Category */
                $result[$category->id] = $category->title;
            }
        }

        return $result;
    }

    /**
     * @param array $transaction2Category
     * @param integer $transactionId
     *
     * @return boolean
     */
    public static function saveTransaction2Category($transaction2Category, $transactionId)
    {
        self::deleteTransaction2CategoryByTransactionId($transactionId);

        foreach($transaction2Category as $idCategory) {
            $model = Category::find()->andWhere(['id' => $idCategory])->one();
            if ($model) {
                $modelTransaction2Category = new Transaction2Category();
                $modelTransaction2Category->category_id = $idCategory;
                $modelTransaction2Category->transaction_id = $transactionId;
                $modelTransaction2Category->save();
            }
        }

        return true;
    }

    /**
     * @param integer $transactionId
     *
     * @return boolean
     */
    public static function deleteTransaction2CategoryByTransactionId($transactionId)
    {
        return Transaction2Category::deleteAll('transaction_id = :transaction_id', [':transaction_id' => $transactionId]);
    }

    /**
     * @param string $date
     *
     * @return string
     */
    public static function getFormattedDate($date)
    {
        $date = Yii::$app->getFormatter()->asDate($date, "php:d.m.Y");

        return self::getBeautyDate($date);
    }

    /**
     * @param string $date
     *
     * @return string
     */
    public static function getBeautyDate($date)
    {
        $nowDate = Yii::$app->getFormatter()->asDate(self::FOR_DATE_NOW, "php:d.m.Y");
        $yesterdayDate = Yii::$app->getFormatter()->asDate(self::FOR_DATE_YESTERDAY, "php:d.m.Y");

        switch ($date) {
            case $nowDate:
                $result = self::$beautyStringForDate[self::FOR_DATE_NOW];
                break;
            case $yesterdayDate:
                $result = self::$beautyStringForDate[self::FOR_DATE_YESTERDAY];
                break;
            default:
                $result = $date;
                break;
        }

        return $result;
    }

    /**
     * @param \frontend\models\Transaction $model
     *
     * @return string
     */
    public static function getAmountValueForGrid(Transaction $model)
    {
        $blockString = [
            'amount' => '',
            'accounts' => self::getAccountsForBlockString($model),
            'category' => self::getCategoryForBlockString($model),
            'comment' => $model->comment
        ];

        return implode(' ', $blockString);
    }

    /**
     * @param \frontend\models\Transaction $model
     *
     * @return string
     */
    public static function getAccountsForBlockString(Transaction $model)
    {
        $result = '';
        /** @var Accounts $accounts */
        $accounts = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if (!empty($accounts)) {
            $result = Html::a(
                $accounts->name,
                Yii::$app->urlManager->createUrl(['transaction/account', 'id' => $accounts->id]),
                [
                    'class' => 'tag',
                    'data-pjax' => '0',
                ]);
        }

        return $result;
    }

    /**
     * @param \frontend\models\Transaction $model
     *
     * @return string
     */
    public static function getCategoryForBlockString(Transaction $model)
    {
        $result = [];
        $transaction2Categories = $model->transaction2Category;

        if (!empty($transaction2Categories)) {
            /** @var Transaction2Category $transaction2Category */
            foreach ($transaction2Categories as $transaction2Category) {
                /** @var Category $category */
                $category = Category::find()->andWhere(['id' => $transaction2Category->category_id])->one();
                if (isset($category)) {
                    $result[] = Html::a(
                        $category->title,
                        Yii::$app->urlManager->createUrl(['transaction/category', 'id' => $category->id]),
                        [
                            'class' => 'tag tag-blue',
                            'data-pjax' => '0',
                        ]);
                }
            }
        }

        return implode(' ', $result);
    }

    /**
     * @param $model Transaction
     *
     * @return string
     */
    public static function getFullAmount(Transaction $model)
    {
        $amount = '';
        $currency = '';
        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if (isset($account)) {
            $amount = explode('.', $model->total);

            $rest = Html::tag(
                'div',
                $amount[1],
                [
                    'class' => 'transaction-currency-rest'
                ]);
            $amount = Html::tag(
                'div',
                $amount[0] . '.' . $rest,
                [
                    'class' => 'transaction-currency-' . self::getClassesForType($model->type_id)
                ]);
            $currency = Html::tag('div', $account->valuta, ['class' => 'unit']);
        }

        return $amount . $currency;
    }

    public static function getTotalAmountsByPeriod($models)
    {
        $totalAmounts = [];

        foreach ($models as $model) {
            /** @var Transaction $model */
            if (isset($totalAmounts[$model->type_id][$model->accounts])) {
                $totalAmounts[$model->type_id][$model->accounts] = number_format(($totalAmounts[$model->type_id][$model->accounts] + $model->total),
                    2, '.', ' ');
            } else {
                $totalAmounts[$model->type_id][$model->accounts] = number_format($model->total, 2, '.', ' ');
            }
            if ($totalAmounts[$model->type_id][$model->accounts] == 0) {
                unset($totalAmounts[$model->type_id][$model->accounts]);
            }
        }

        return $totalAmounts;
    }
}