<?php

use common\enums\StatusEnum;
use common\helper\ComplexHelper;
use kartik\select2\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\House */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="house-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'complexId')->widget(Select2::classname(), [
        'data' => ComplexHelper::getListComplexes(),
        'options' => [
            'placeholder' => 'Choose complex ...',
        ],
        'pluginEvents' => []
    ]) ?>

    <?= $form->field($model, 'status')->widget(Select2::classname(), [
        'data' => StatusEnum::getStatusList()
    ])
    ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
