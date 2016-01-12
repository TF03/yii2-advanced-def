<?php

use frontend\helper\AccountsHelper;
use frontend\helper\TransactionHelper;
use kartik\date\DatePicker;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var $this yii\web\View */
/** @var $model \frontend\models\Transaction */

$this->title = 'Новая операция';
$this->params['breadcrumbs'][] = ['label' => 'Операции', 'url' => ['/transaction']];
$this->params['breadcrumbs'][] = $this->title;

$model->date = Yii::$app->getFormatter()->asDate('now', "php:d-m-Y");
$firstValuta = AccountsHelper::getFirstValuta();

$this->registerJsFile('/js/frontend/views/transaction.js', ['depends' => 'frontend\assets\BackboneAsset']);
?>

<div class="row">
    <div class="col-md-12">

        <?php $form = ActiveForm::begin([
                                            'id' => 'transaction-new',
                                            //'options' => ['class' => 'form-horizontal'],
                                        ]) ?>

        <div class="col-md-3">
            <?= $form->field($model, 'amount')
                ->textInput(['placeholder' => 'Введите число'])
                ->label('Величина (' . $firstValuta . ')*', [
                    'id' => 'amountLabel'
                ]); ?>
            <?= $form->field($model, 'type_id', [
                'options' => [
                    'class' => 'form-group'
                ],
            ])->label(false)
                ->radioList(TransactionHelper::getValues(), [
                'item' => function ($index, $label, $name, $checked, $value) {
                    $check = ($index == 0) ? ' checked="checked"' : '';
                    $classes = (isset($value)) ? TransactionHelper::getClassesForType($value) : '';
                    return "<label class=\"form__param type-id $classes\">
                                    <input type=\"radio\" name=\"$name\" value=\"$value\"$check>
                                    $label
                                </label>";
                }]) ?>
            <?= $form->field($model, 'date')->label($model->getAttributeLabel('date') . '*')->widget(DatePicker::className(),
                                                                                                     [
                                                                                                         'type' => DatePicker::TYPE_INPUT,
                                                                                                         'pluginOptions' => [
                                                                                                             'autoclose' => true,
                                                                                                             'format' => 'dd-mm-yyyy'
                                                                                                         ]
                                                                                                     ]
            ); ?>
            <?= $form->field($model, 'comment')->textInput([]); ?>
            <?= $form->field($model, 'accounts', [
                'options' => [
                    'class' => 'form-group'
                ],
            ])->radioList(AccountsHelper::getListAccounts(), [
                'item' => function ($index, $label, $name, $checked, $value) {
                    $label = explode('!!', $label);
                    $valuta = $label[1];
                    $label = $label[0];
                    $check = ($index == 0) ? ' checked="checked"' : '';
                    return "<label class=\"form__param\">
                                    <input type=\"radio\" class=\"account_id\" id=\"account_id_$value\" name=\"$name\" value=\"$value\"$check>
                                    $label
                                    <input type=\"hidden\" id=\"current_$value\" value=\"$valuta\">
                                </label>";
                }]) ?>
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

        <div class="col-md-12 form-actions">
            <?= Html::a('Отмена', Url::to(['/transaction']), ['class' => 'btn btn-default']); ?>
            <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']); ?>
        </div>

        <?php ActiveForm::end() ?>

    </div>
</div>
