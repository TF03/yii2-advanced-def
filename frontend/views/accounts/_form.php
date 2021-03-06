<?php

use frontend\helper\UserHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\color\ColorInput;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model common\models\Accounts */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="accounts-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id', [
        'template' => "{input}",
    ])->hiddenInput(['value' => Yii::$app->getUser()->id])->label('')->error(false) ?>

    <?= $form->field($model, 'currencyId')->widget(Select2::classname(), [
        'data' => UserHelper::getCurrentListCurrency(),
        'options' => [
            'placeholder' => 'Выберите валюту ...',
        ]
    ]) ?>

    <?= $form->field($model, 'color')->widget(ColorInput::classname(), [
        'options' => ['placeholder' => 'Выберите цвет ...'],
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Создать' : 'Обновить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
