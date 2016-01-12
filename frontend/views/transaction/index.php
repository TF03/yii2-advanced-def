<?php

use yii\grid\GridView;
use yii\bootstrap\ButtonDropdown;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\TransactionSearch */
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
                                         'filterModel' => $searchModel,
                                         'showOnEmpty' => false,
                                         'columns' => [
                                             ['class' => 'yii\grid\SerialColumn'],
                                             'id',
                                             'comment',
                                             'amount',
                                             'accounts',
                                             'user_id',
                                             // 'type_id',
                                             // 'status',
                                             // 'created_at',
                                             // 'date',
                                             ['class' => 'yii\grid\ActionColumn'],
                                         ],
                                     ]); ?>
            </div>
        </div>
    </div>
</div>