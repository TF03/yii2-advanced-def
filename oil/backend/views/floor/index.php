<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\FlooreSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Floors';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="floor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Floor', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'houseId',
                'value' => function ($model) {
                    /** @var $model \common\models\Floor */
                    $house = \common\models\House::findOne(['id' => $model->houseId]);

                    return ($house) ? $house->name : null;

                },
                'format' => 'html',
                'filter' => \common\helper\HouseHelper::getListHouses()
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    /** @var $model \common\models\Floor */
                    return \common\enums\StatusEnum::getStatusValue($model->status);

                },
                'format' => 'html',
                'filter' => \common\enums\StatusEnum::getStatusList()
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
