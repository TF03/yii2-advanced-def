<?php

use common\enums\StatusEnum;
use common\models\Complex;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\ComplexSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Complexes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="complex-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Complex', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    /** @var $model Complex */
                    return StatusEnum::getStatusValue($model->status);

                },
                'format' => 'html',
                'filter' => StatusEnum::getStatusList()
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
