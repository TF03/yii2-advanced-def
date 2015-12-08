<?php

use common\widgets\Alert;
use frontend\helper\StatusHelper;
use kartik\sortable\Sortable;
use kartik\switchinput\SwitchInput;
use yii\helpers\Html;
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
          'options' => [
              'class' => 'switchInputCategory'
          ],
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

    $remove = '';
    if (!isset($model->base_category_id)) {
        $remove = Html::a('', Yii::$app->urlManager->createUrl(['category/remove', 'id' => $model->id]), [
            'class' => 'btn btn-danger glyphicon glyphicon-remove management-help',
            'data-pjax' => 'false',
            'data' => [
                'confirm' => 'Вы уверены, что хотите удалить категорию? Тогда все записи связанные с категорией будут удалены.',
                'method' => 'post',
            ]
        ]);
    }

    $list[] = [
        'content' => '
                        <div class="col-md-8">' . $model->title . '</div>
                        <div class="col-md-2">' . $switch . '</div>
                        <div class="col-md-2">' .
                                Html::a('', Yii::$app->urlManager->createUrl(['category/edit', 'id' => $model->id]), [
                                    'class' => 'btn btn-info glyphicon glyphicon-pencil management-help',
                                    'data-pjax' => 'false'
                                ]) .
                                $remove .
                        '</div>',
        'options' => [
            'data-icat' => $model->id
        ]
    ];
}

?>

<?php Pjax::begin([
    'enablePushState' => false
]); ?>

<?= Alert::widget() ?>

    <div class="category-index">

        <p>
            <?= Html::a('Новая категория', ['new'], ['class' => 'btn btn-success', 'data-pjax' => 'false']) ?>
        </p>

            <?= Sortable::widget([
                'items' => $list,
                'options' => [
                    'class' => 'category-sortable'
                ],
                'pluginEvents' => [
                    'sortupdate' => 'function(e, ui) {
                                                    var item = $(ui.item),
                                                    data = $(".category-sortable").find("li").map(function (i, n) {
                                                        return $(n).data("icat");
                                                    }).get().join(",");
                                                    $.ajax({
                                                            url: "' . Yii::$app->urlManager->createUrl(["category/sort-category"]) . '",
                                                            type: "post",
                                                            data: {"sort": data},
                                                            cache: false,
                                                            success: function(data) {}
                                                    });}',
                ]
            ]);
            ?>

    </div>

<?php Pjax::end(); ?>
