<?php

use kartik\nav\NavX;

/** @var $this yii\web\View */


echo NavX::widget([
    'options' => ['class' => 'nav nav-pills'],
    'items' => [
        ['label' => 'Все операции', 'active' => true, 'url' => Yii::$app->urlManager->createUrl(['transaction'])],
        ['label' => 'Доходы', 'url' => Yii::$app->urlManager->createUrl(['transaction/income'])],
        ['label' => 'Расходы', 'url' => Yii::$app->urlManager->createUrl(['transaction/expense'])],
        ['label' => 'Переводы', 'url' => Yii::$app->urlManager->createUrl(['transaction/transfer'])],
    ]
]);