<?php

use common\widgets\Alert;
use yii\helpers\Html;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\AccountsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Счета';
$this->params['breadcrumbs'][] = $this->title;
?>

<?= Alert::widget() ?>

<div class="accounts-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Новый счет', ['new'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Новый перевод', Yii::$app->urlManager->createUrl(['transaction/transfer']), ['class' => 'btn btn-info']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'showOnEmpty' => false,
        'layout' => "{items}\n{pager}",
        'filterModel' => $searchModel,
        'columns' => [
            'name',
            'amount',
            [
                'attribute' => 'currencyId',
                'headerOptions' => ['width' => '100'],
                'filter' => false,
                'content' => function ($data) {
                    /** @var $data \frontend\models\Accounts */
                    if ($data->currency) {
                        return $data->currency->title;
                    }

                    return false;
                }
            ],
            [
                'class' => ActionColumn::className(),
                'template' => '{update}',
                //'template' => '{update} {delete}',
            ],
        ],
    ]); ?>

</div>
