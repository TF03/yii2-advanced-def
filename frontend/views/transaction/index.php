<?php

use common\widgets\Alert;
use frontend\helper\TransactionHelper;
use frontend\models\Currency;
use kartik\nav\NavX;
use yii\bootstrap\ButtonDropdown;
use yii\bootstrap\Html;
use yii\grid\ActionColumn;
use yii\grid\CheckboxColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var $this yii\web\View
 * @var $dataProvider yii\data\ActiveDataProvider
 * @var $totalAmounts array
 * @var $activeIncome boolean
 * @var $activeExpense boolean
 * @var $filterEnable boolean
 */

$this->title = 'Операции';
$this->params['breadcrumbs'][] = $this->title;

$period = Yii::$app->request->get('period');
?>

<?= Alert::widget() ?>

<div class="row">

    <div class="col-md-12 transaction">
        <div class="col-md-2">
            <?php echo $this->render('_filter', [
                'activeIncome' => isset($activeIncome) ? $activeIncome : false,
                'activeExpense' => isset($activeExpense) ? $activeExpense : false
            ], true); ?>
            <div class="row">
                <ul class="total-transactions">
                <?php
                    foreach($totalAmounts as $typeId => $totalAmount) {
                        ?>
                        <li class="<?= TransactionHelper::getClassesForType($typeId) ?>">
                            <span class="label-type-transaction"><?= TransactionHelper::getValue($typeId) ?></span>
                            <ul><?php
                            foreach($totalAmount as $currencyId => $total) {
                                echo Html::tag('li', number_format($total, 2, '.', ' ') . ' ' . Currency::findOne(['id' => $currencyId])->title);
                            }
                            ?>
                            </ul>
                        </li><?php
                    }
                ?>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="col-md-4">
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
            <div class="col-md-8 periods-transactions">

                <label class="pills">Период</label>
                <?= NavX::widget([
                    'options' => ['class' => 'nav nav-pills small'],
                    'items' => [
                        [
                            'label' => 'Сегодня',
                            'url' => Yii::$app->urlManager->createUrl([Yii::$app->request->pathInfo, 'period' => 'today']),
                            'active' => $period == 'today' ? true : false
                        ],
                        [
                            'label' => 'Вчера',
                            'url' => Yii::$app->urlManager->createUrl([Yii::$app->request->pathInfo, 'period' => 'yesterday']),
                            'active' => $period == 'yesterday' ? true : false
                        ],
                        [
                            'label' => 'В этом месяце',
                            'url' => Yii::$app->urlManager->createUrl([Yii::$app->request->pathInfo, 'period' => 'current_month']),
                            'active' => ($period == 'current_month' || empty($period)) ? true : false
                        ],
                        [
                            'label' => 'За все время',
                            'url' => Yii::$app->urlManager->createUrl([Yii::$app->request->pathInfo, 'period' => 'all']),
                            'active' => $period == 'all' ? true : false
                        ],
                    ]
                ]); ?>

            </div>

            <?php if (isset($filterEnable)) { ?>
                <div>
                    <?= Html::a(
                        '<i class="glyphicon glyphicon-remove"></i>Отменить примененный фильтр',
                        Yii::$app->urlManager->createUrl(['transaction']),
                        [
                            'class' => 'clear-filter'
                        ]
                    ); ?>
                </div>
            <?php } ?>

            <div>

                <?php Pjax::begin([
                    'timeout' => 10000,
                    'enablePushState' => false,
                    'clientOptions' => [
                        'container' => 'pjax-container'
                    ]]);
                ?>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'showOnEmpty' => false,
                    'layout' => "{items}\n{pager}",
                    'tableOptions' => [
                        'class' => 'table'
                    ],
                    'pager' => [
                        'prevPageLabel' => 'Предыдущая',
                        'nextPageLabel' => 'Следующая'
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
                                'min-width' => '200'
                            ],
                            'contentOptions' => [
                                'class' => 'transaction-amount'
                            ],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                if ($data->type_id == TransactionHelper::TYPE_TRANSFER) {
                                    return TransactionHelper::getFullAmountForTransfer($data);
                                } else {
                                    return TransactionHelper::getFullAmount($data);
                                }
                            },
                        ],
                        [
                            'attribute' => '',
                            'headerOptions' => ['width' => '500'],
                            'content' => function ($data) {
                                /** @var $data \frontend\models\Transaction */
                                return TransactionHelper::getAmountValueForGrid($data);
                            },
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
                                'edit' => function ($url, $model) {
                                    /** @var $model \frontend\models\Transaction */
                                    if ($model->type_id != TransactionHelper::TYPE_TRANSFER) {
                                        return Html::a(
                                            '<span class="glyphicon glyphicon-pencil"></span>',
                                            $url);
                                    }
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

                <?php Pjax::end(); ?>
            </div>
        </div>
    </div>
</div>