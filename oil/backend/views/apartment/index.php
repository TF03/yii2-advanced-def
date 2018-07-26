<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\ApartmentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Apartments';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="apartment-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Apartment', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'floorId',
                'value' => function ($model) {
                    /** @var $model \common\models\Apartment */
                    $floor = \common\models\Floor::findOne(['id' => $model->floorId]);

                    return ($floor) ? $floor->name : null;

                },
                'format' => 'html',
                'filter' => \common\helper\FloorHelper::getListFloors()
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    /** @var $model \common\models\Apartment */
                    return \common\enums\StatusEnum::getStatusValue($model->status);

                },
                'format' => 'html',
                'filter' => \common\enums\StatusEnum::getStatusList()
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
