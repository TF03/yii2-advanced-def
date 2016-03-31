<?php

use yii\bootstrap\ButtonDropdown;
use yii\bootstrap\Html;
use yii\grid\ActionColumn;
use yii\grid\CheckboxColumn;
use yii\grid\GridView;
use frontend\helper\TransactionHelper;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Операции';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="row">

    <div class="col-md-12 transaction">
        <div class="col-md-2">
            <?php echo $this->render('_filter', [], true); ?>
        </div>
        <div class="col-md-10">
            <div>
                <?=
                ButtonDropdown::widget([
                    'label' => 'Новый расход',
                    'tagName' => 'a',
                    'options' => [
                        'class' => 'btn-sm btn-success',
                        'href' => Yii::$app->urlManager->createUrl(['transaction/new']),
                    ],
                    'split' => true,
                    'dropdown' => [
                        'items' => [
                            [
                                'label' => 'Новый расход',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/new'])
                            ],
                            [
                                'label' => 'Новый доход',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/new-income'])
                            ],
                            [
                                'label' => 'Новый перевод',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/transfer'])
                            ]
                        ]
                    ]
                ]);
                ?>
            </div>
            <div>
                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'showOnEmpty' => false,
                    'layout' => "{items}\n{pager}",
                    'tableOptions' => [
                        'class' => 'table'
                    ],
                    'columns' => [
                        [
                            'class' => CheckboxColumn::className(),
                            'headerOptions' => ['class' => 'check'],
                        ],
                        [
                            'attribute' => 'date',
                            'headerOptions' => ['width' => '100'],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                return TransactionHelper::getFormattedDate($data->date);
                            }
                        ],
                        [
                            'attribute' => 'total',
                            'headerOptions' => [
                                'class' => 'transaction-amount',
                                'min-width' => '100'
                            ],
                            'contentOptions' => [
                                'class' => 'transaction-amount'
                            ],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                return TransactionHelper::getFullAmount($data);
                            }
                        ],
                        [
                            'attribute' => '',
                            'headerOptions' => ['width' => '500'],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                return TransactionHelper::getAmountValueForGrid($data);
                            }
                        ],
                        [
                            'attribute' => 'created_at',
                            'headerOptions' => ['width' => '100'],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                return TransactionHelper::getFormattedDate($data->created_at);
                            }
                        ],
                        [
                            'class' => ActionColumn::className(),
                            'header' => '',
                            'contentOptions' => [
                                'class' => 'button-group'
                            ],
                            'template' => '{edit} {remove}',
                            'buttons' => [
                                'edit' => function ($url) {
                                    return Html::a(
                                        '<span class="glyphicon glyphicon-pencil"></span>',
                                        $url);
                                },
                                'remove' => function ($url) {
                                    return Html::a('', $url, [
                                        'class' => 'glyphicon glyphicon-remove',
                                        'data-pjax' => 'false',
                                        'data' => [
                                            'confirm' => 'Вы уверены, что хотите удалить транзакцию?',
                                            'method' => 'post',
                                        ]
                                    ]);
                                },
                            ]
                        ]
                    ]
                ]); ?>
            </div>
        </div>
    </div>
</div>