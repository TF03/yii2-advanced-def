<?php

use common\enums\TargetStatusEnum;
use frontend\models\Targets;
use common\widgets\Alert;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\search\TargetsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Цели';
$this->params['breadcrumbs'][] = $this->title;
?>

<?= Alert::widget() ?>

<div class="targets-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Отложить', ['save-on-target'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Новая цель', ['new'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'name',
            'value',
            'balance',
            //'accounts',
            'date',
            'order',
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    /** @var $model Targets */
                    return TargetStatusEnum::getStatusValue($model->status);

                },
                'format' => 'html',
                'filter' => TargetStatusEnum::getStatusList()
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {remove}',
            ],
        ],
    ]); ?>
</div>
