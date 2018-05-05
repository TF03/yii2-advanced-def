<?php

use common\enums\TargetStatusEnum;
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model frontend\models\Targets */
/* @var $form yii\widgets\ActiveForm */

$model->date = empty($model->date) ? date('d-m-Y', strtotime(date('d-m-Y') . " + 1 year")) : $model->date;
?>

<div class="targets-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput([
        'maxlength' => true,
        'placeholder' => 'Например: Квартира'
    ]) ?>

    <?= $form->field($model, 'value')->textInput([
        'maxlength' => true,
        'placeholder' => 'Например: 300 500'
    ]) ?>

    <?= $form->field($model, 'balance')->textInput([
        'maxlength' => true,
        'placeholder' => 'Например: 50 000'
    ]) ?>

    <?= $form->field($model, 'date')
        ->label($model->getAttributeLabel('date'))
        ->widget(DatePicker::className(),
            [
                'type' => DatePicker::TYPE_INPUT,
                'pluginOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-mm-yyyy'
                ]
            ]
        ); ?>

    <?php
    if (!$model->isNewRecord) {
        echo $form->field($model, 'status')->widget(Select2::classname(), [
            'data' => TargetStatusEnum::getStatusList()
        ]);
    }
    ?>

    <?= $form->field($model, 'order')->textInput([
        'placeholder' => '1, 2.... влияет на сортировку'
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Создать' : 'Обновить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
