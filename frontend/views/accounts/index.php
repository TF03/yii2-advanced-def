<?php

use yii\helpers\Html;
use yii\grid\GridView;
use frontend\helper\UserHelper;
use frontend\helper\StatusHelper;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\search\AccountsSearch */
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
                                 'id',
                                 'name',
                                 [
                                     'attribute' => 'user_id',
                                     'value' => function ($model) {
                                         return UserHelper::getCurrentUserName($model->user_id);
                                     },
                                 ],
                                 'valuta',
                                 'color',
                                 'amount',
                                 [
                                     'attribute' => 'status',
                                     'value' => function ($model) {
                                         return StatusHelper::getStatusName($model->status);
                                     },
                                 ],
                             ],
                         ]); ?>

</div>
