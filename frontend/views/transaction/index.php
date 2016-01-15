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
                                                       'url' => Yii::$app->urlManager->createUrl(['transaction/new', 'type' => 'income'])
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
                                                 'content' => function($data) {
                                                     /** @var $data \frontend\models\Transaction  */
                                                     return TransactionHelper::getFormattedDate($data->date);
                                                 }
                                             ],
                                             [
                                                 'attribute' => 'amount',
                                                 'headerOptions' => [
                                                     'class' => 'transaction-amount',
                                                     'width' => '100'
                                                 ],
                                                 'contentOptions' => [
                                                     'class' => 'transaction-amount'
                                                 ],
                                                 'content' => function($data) {
                                                     /** @var $data \frontend\models\Transaction  */
                                                     return TransactionHelper::getFullAmount($data);
                                                 }
                                             ],
                                             [
                                                 'attribute' => '',
                                                 'headerOptions' => ['width' => '500'],
                                                 'content' => function($data) {
                                                     /** @var $data \frontend\models\Transaction  */
                                                     return TransactionHelper::getAmountValueForGrid($data);
                                                 }
                                             ],
                                             [
                                                 'attribute' => 'created_at',
                                                 'headerOptions' => ['width' => '100'],
                                                 'content' => function($data) {
                                                     /** @var $data \frontend\models\Transaction  */
                                                     return TransactionHelper::getFormattedDate($data->created_at);
                                                 }
                                             ],
                                             [
                                                 'class' => ActionColumn::className(),
                                                 'header' => '',
                                                 //'headerOptions' => ['width' => '80'],
                                                 'template' => '{update} {delete}',
                                                 'buttons' => [
                                                     'update' => function ($url,$model) {
                                                         return Html::a(
                                                             '<span class="glyphicon glyphicon-pencil"></span>',
                                                             $url);
                                                     },
                                                     'delete' => function ($url,$model,$key) {
                                                         return Html::a(
                                                             '<span class="glyphicon glyphicon-remove"></span>',
                                                             $url);
                                                     },
                                                 ]
                                             ]
                                         ]
                                     ]); ?>
            </div>
        </div>
    </div>
</div>