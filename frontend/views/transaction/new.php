<?php

use yii\bootstrap\ActiveForm;

/** @var $this yii\web\View */
/** @var $model \frontend\models\Transaction */

$this->title = 'Новая операция';
$this->params['breadcrumbs'][] = ['label' => 'Операции', 'url' => ['/transaction']];
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="row">
    <div class="col-md-12">

        <?php $form = ActiveForm::begin([
            'id' => 'login-form',
            'options' => ['class' => 'form-horizontal'],
        ]) ?>

        <div class="col-md-3">
            <?= $form->field($model, 'amount')->textInput(['placeholder' => 'Введите число'])->label('Величина (грн.)'); ?>
        </div>
        <div class="col-md-9">
        </div>

        <?php ActiveForm::end() ?>

    </div>
</div>
