<?php

use frontend\helper\TransactionHelper;
use kartik\date\DatePicker;
use yii\bootstrap\ActiveForm;

/** @var $this yii\web\View */
/** @var $model \frontend\models\Transaction */

$this->title = 'Новая операция';
$this->params['breadcrumbs'][] = ['label' => 'Операции', 'url' => ['/transaction']];
$this->params['breadcrumbs'][] = $this->title;

/** Formatter for date
 * $model->start_date = Yii::$app->getFormatter()->asDatetime($model->start_date, "php:m/d/yy H:i");
 */
$model->date = '30-12-2015';

?>

<div class="row">
    <div class="col-md-12">

        <?php $form = ActiveForm::begin([
                                            'id' => 'login-form',
                                            'options' => ['class' => 'form-horizontal'],
                                        ]) ?>

        <div class="col-md-3">
            <?= $form->field($model, 'amount')->textInput(['placeholder' => 'Введите число'])->label('Величина (грн.)'); ?>
            <?= $form->field($model, 'date')->widget(DatePicker::className(),
                                                     [
                                                         'type' => DatePicker::TYPE_INPUT,
                                                         'pluginOptions' => [
                                                             'autoclose' => true,
                                                             'format' => 'dd-mm-yyyy'
                                                         ]
                                                     ]
            ); ?>
            <?= $form->field($model, 'comment')->textInput([]); ?>
        </div>
        <div class="col-md-9">
            <?= $form->field($model, 'transaction2Category', [
                'options' => [
                    'id' => 'transaction2Category',
                    'class' => 'form-group'
                ],
                'inputOptions' => [
                    'class' => 'form-control custom-class_field1 custom-class_field2'
                ],
                //'template' => "\n\t<!-- Этикетка, название поля -->\n\t{label}\n\n\t<!-- Поле формы -->\n\t{input}\n\n\t<!-- Блок подсказки - выводится только если есть содержимое-->\n\t{hint}\n\n\t<!-- Блок сообщения об ошибке - появляется/исчезает при наличие ошибок валидации формы -->\n\t{error}"
            ])->checkboxList(TransactionHelper::getListTransaction()) ?>
        </div>

        <?php ActiveForm::end() ?>

    </div>
</div>
