<?php

namespace frontend\helper;

use common\models\Transaction2Category;
use frontend\models\Category;

class TransactionHelper
{
    const TYPE_INCOME = 1;
    const TYPE_CONSUMPTION = 2;

    /**
     * @return array
     */
    public static function getListTransaction()
    {
        $result = [];

        $categories = Category::find()->all();
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
}