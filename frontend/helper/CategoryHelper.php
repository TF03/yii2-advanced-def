<?php


namespace frontend\helper;

use common\enums\PeriodFilterEnum;
use common\models\Transaction2Category;
use frontend\models\Accounts;
use frontend\models\Category;
use frontend\models\Currency;
use frontend\models\Transaction;
use yii;
use yii\db\Query;

class CategoryHelper extends BaseHelper
{
    public static function getCategoryLimitsByPeriod(): array
    {
        $today = DateHelper::getNowDate();
        $period = Yii::$app->request->get('period');
        $period = $period ?: PeriodFilterEnum::CURRENT_MONTH;
        $finder = (new Query())
            ->select(['category.title', 'sum(transaction.total) total', 'category.month_limit', 'currency.title currency'])
            ->from(Transaction::tableName())
            ->leftJoin(Transaction2Category::tableName(),'transaction_id = transaction.id')
            ->leftJoin(Category::tableName(),'category_id = category.id')
            ->leftJoin(Accounts::tableName(),'transaction.accounts = accounts.id')
            ->leftJoin(Currency::tableName(),'accounts.currencyId = currency.id')
            ->andWhere(['>', 'category.month_limit', 0])
            ->andWhere(['!=', 'transaction.type_id', TransactionHelper::TYPE_TRANSFER])
            ->andWhere(['transaction.user_id' => Yii::$app->getUser()->id]);
        switch($period) {
            case PeriodFilterEnum::TODAY:
                $finder->andWhere(['like', 'date', $today]);
                break;
            case PeriodFilterEnum::YESTERDAY:
                $yesterday = date('Y-m-d', strtotime(date('Y-m-d') . " - 1 day"));
                $finder->andWhere(['like', 'date', $yesterday]);
                break;
            case PeriodFilterEnum::CUSTOM:
                $periodFrom = Yii::$app->request->get('periodFrom');
                if (empty($periodFrom)) {
                    $periodFrom = $today;
                } else {
                    $periodFrom = date('Y-m-d', strtotime($periodFrom));
                }

                $periodTo = Yii::$app->request->get('periodTo');
                if (empty($periodTo)) {
                    $periodTo = $today;
                } else {
                    $periodTo = date('Y-m-d', strtotime($periodTo));
                }
                if ($periodFrom > $periodTo) {
                    $finder->andWhere(['like', 'date', $periodFrom]);
                } else {
                    $finder->andWhere(['>=', 'date', $periodFrom]);
                    $finder->andWhere(['<=', 'date', $periodTo]);
                }

                break;
            case PeriodFilterEnum::ALL:
                break;
            case PeriodFilterEnum::CURRENT_MONTH:
            default:
                $finder->andWhere(['like', 'date', DateHelper::getNowDate("php:Y-m")]);
                break;
        }

        return $finder
            ->groupBy(['category.id', 'accounts.currencyId'])
            ->orderBy('(sum(transaction.total)/category.month_limit) DESC')
            ->all();
    }
}
