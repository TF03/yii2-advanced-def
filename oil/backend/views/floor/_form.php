<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Floor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="floor-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'houseId')->widget(\kartik\select2\Select2::classname(), [
        'data' => \common\helper\HouseHelper::getListHouses(),
        'options' => [
            'placeholder' => 'Choose house ...',
        ],
        'pluginEvents' => []
    ]) ?>

    <?= $form->field($model, 'status')->widget(\kartik\select2\Select2::classname(), [
        'data' => \common\enums\StatusEnum::getStatusList()
    ])
    ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
