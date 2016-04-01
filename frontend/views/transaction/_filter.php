<?php

use kartik\nav\NavX;

/** @var $this yii\web\View */
/** @var $activeIncome boolean */
/** @var $activeExpense boolean */


echo NavX::widget([
    'options' => ['class' => 'nav nav-pills'],
    'items' => [
        [
            'label' => 'Все операции',
            'url' => Yii::$app->urlManager->createUrl(['transaction']),
            'active' => (!$activeIncome && !$activeExpense) ? true : false
        ],
        [
            'label' => 'Доходы',
            'url' => Yii::$app->urlManager->createUrl(['transaction/filter/income']),
            'active' => $activeIncome ? true : false
        ],
        [
            'label' => 'Расходы',
            'url' => Yii::$app->urlManager->createUrl(['transaction/filter/expense']),
            'active' => $activeExpense ? true : false
        ],
        //['label' => 'Переводы', 'url' => Yii::$app->urlManager->createUrl(['transaction/transfer'])],
    ]
]);