<?php

use common\widgets\Alert;
use frontend\helper\AccountsHelper;
use kartik\tabs\TabsX;

/** @var $this yii\web\View */
/** @var $model \frontend\models\Transaction */
/** @var $modelTransfer \frontend\models\forms\TransferForm */
/** @var $tabTransfer boolean */

$this->title = 'Новая операция';
$this->params['breadcrumbs'][] = ['label' => 'Операции', 'url' => ['/transaction']];
$this->params['breadcrumbs'][] = $this->title;

$model->accounts = AccountsHelper::getFirstAccountId();
$tabTransfer = isset($tabTransfer) ? $tabTransfer : false;
?>

<?= Alert::widget() ?>

<?php
    $items = [
        [
            'label' => 'Новая операция',
            'content' => $this->render('_forms/_edit', [
                'model' => $model
            ]),
            'active' => !$tabTransfer
        ],
        [
            'label' => '<i class="glyphicon glyphicon-transfer"></i> Перевод',
            'content' => $this->render('_forms/_transfer', [
                'model' => $modelTransfer
            ]),
            'active' => $tabTransfer
        ]
    ];
    ?>

    <?= TabsX::widget([
    'items' => $items,
    'position' => TabsX::POS_ABOVE,
    'containerOptions' => [
        'class' => 'view-account-detail'
    ],
    'encodeLabels' => false
]); ?>