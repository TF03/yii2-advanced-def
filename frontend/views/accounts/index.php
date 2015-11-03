<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\AccountsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Счета';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accounts-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Новый счет', ['new'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
                             'dataProvider' => $dataProvider,
                             'filterModel' => $searchModel,
                             'columns' => [
                                 ['class' => 'yii\grid\SerialColumn'],

                                 'id',
                                 'name',
                                 [
                                     'attribute' => 'user_id',
                                     'value' => function ($model) {
                                         return \frontend\models\User::findOne(['id' => $model->id])->username;
                                     },
                                 ],
                                 'valuta',
                                 'color',
                                 'amount',
                                 [
                                     'attribute' => 'status',
                                     'value' => function ($model) {
                                         return \frontend\helper\StatusHelper::getStatusName($model->status);
                                     },
                                 ],
                                 // 'sort',

                                 ['class' => 'yii\grid\ActionColumn'],
                             ],
                         ]); ?>

</div>
