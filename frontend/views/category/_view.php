<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\Pjax;

/**
 * @var $model \common\models\search\CategorySearch
 */

?>
<div class="col-md-12">

    <div class="col-md-8">
        <h3><?= Html::encode($model->title) ?></h3>
    </div>

    <div class="col-md-2 category-help-block">
        <p>
            <?php Pjax::begin(); ?>

            <?php $form = ActiveForm::begin([
                'options' => ['data-pjax' => true],
                'fieldConfig' => [
                    'template' => "{label}\n{input}\n{hint}\n",
                ]
            ]); ?>

            <?= $form->field($model, 'id', [
                'template' => "{input}",
            ])->hiddenInput() ?>

            <?= $form->field($model, 'status', [
                'template' => "{input}",
            ])->checkbox([
                'title' => 'Отображать',
                'onchange' => "$(this.form).submit();"
            ], FALSE)->label(false) ?>

            <?php ActiveForm::end(); ?>

            <?php Pjax::end(); ?>

            <?= Html::a('', ['edit', 'id' => $model->id], [
                'class' => 'glyphicon glyphicon-pencil',
                'title' => 'Редактирование'
            ]) ?>

            <?php
            if (is_null($model->base_category_id) == true) {
                echo Html::a('', ['remove', 'id' => $model->id], [
                    'class' => 'glyphicon glyphicon-remove',
                    'data' => [
                        'confirm' => 'Вы уверены, что хотите удалить запись?',
                        'method' => 'post',
                    ],
                ]);
            }
            ?>
        </p>
    </div>

</div>