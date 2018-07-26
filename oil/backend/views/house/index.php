<?php

use common\enums\StatusEnum;
use common\helper\ComplexHelper;
use common\models\House;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\HouseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Houses';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="house-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create House', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'complexId',
                'value' => function ($model) {
                    /** @var $model House */
                    $complex = \common\models\Complex::findOne(['id' => $model->complexId]);

                    return ($complex) ? $complex->name : null;

                },
                'format' => 'html',
                'filter' => ComplexHelper::getListComplexes()
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    /** @var $model House */
                    return StatusEnum::getStatusValue($model->status);

                },
                'format' => 'html',
                'filter' => StatusEnum::getStatusList()
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
