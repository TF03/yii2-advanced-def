<?php

namespace frontend\widgets\grid;

use frontend\helper\TransactionHelper;

class TotalColumn
{
    public static function pageTotal($provider, $fieldName)
    {
        $totalExpense = 0;
        foreach ($provider as $item) {
            if ($item['type_id'] == TransactionHelper::TYPE_EXPENSE) {
                $totalExpense += $item[$fieldName];
            }
        }
        return number_format($totalExpense, 2, '.', ' ');
    }
}
