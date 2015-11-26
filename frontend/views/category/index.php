<?php

use frontend\helper\StatusHelper;
use kartik\sortable\Sortable;
use kartik\switchinput\SwitchInput;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;

/* @var $modelAll frontend\models\Category */

$this->title = 'Категории';
$this->params['breadcrumbs'][] = $this->title;

$list = [];

/** @var \frontend\models\Category $model */
foreach ($modelAll as $model) {
    $switch = SwitchInput::widget([
          'name' => 'status_' . $model->id,
          'value' => StatusHelper::getValueForHtml($model->status),
          'pluginOptions' => [
              'onText' => 'Отображать',
              'offText' => 'Скрыть',
              'onColor' => 'success',
              'offColor' => 'danger',
              'size' => 'small'
          ],
          'pluginEvents' => [
              "switchChange.bootstrapSwitch" => 'function(event, state) {
                                                    $.ajax({
                                                            url: "' . Yii::$app->urlManager->createUrl(["category/hidden-category", 'id' => $model->id]) . '",
                                                            type: "post",
                                                            data: {"value": +state},
                                                            cache: false,
                                                            success: function(data) {}
                                                    });
                                                }',
          ]
    ]);
    $list[] = [
        'content' => '
                        <div class="col-md-8">' . $model->title . '</div>
                        <div class="col-md-2">' . $switch . '</div>
                        <div class="col-md-2">' .
                                Html::a('', Yii::$app->urlManager->createUrl(['category/edit', 'id' => $model->id]), [
                                    'class' => 'btn btn-info glyphicon glyphicon-pencil management-help',
                                    'pjax' => false
                                ]) .
                                Html::a('', Yii::$app->urlManager->createUrl(['category/remove', 'id' => $model->id]), [
                                    'class' => 'btn btn-danger glyphicon glyphicon-remove management-help',
                                    'data' => [
                                        'confirm' => 'Are you sure you want to delete this item?',
                                        'method' => 'post',
                                    ],
                                    'pjax' => true
                                ]) .
                        '</div>',
        'options' => [
            'data-iCat' => $model->id
        ]
    ];
}

?>
<div class="category-index">

    <p>
        <?= Html::a('Новая категория', ['new'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin([
        'enablePushState' => false
      ]); ?>

        <?= Sortable::widget([
            'items' => $list,
            'options' => [
                'class' => 'category-sortable'
            ],
            'pluginEvents' => [

            ]
        ]);
        ?>

    <?php Pjax::end(); ?>

</div>
