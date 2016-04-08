<?php

use frontend\helper\AccountsHelper;
use kartik\date\DatePicker;
use kartik\select2\Select2;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var $this yii\web\View */
/** @var $model \frontend\models\forms\TransferForm */

$this->title = 'Новый перевод';

$model->date = Yii::$app->getFormatter()->asDate('now', "php:d-m-Y");
$firstValuta = AccountsHelper::getFirstValuta();
$model->toAccountId = $model->fromAccountId = AccountsHelper::getFirstAccountId();

//$this->registerJsFile('/js/frontend/views/transaction/transfer.js', ['depends' => 'frontend\assets\BackboneAsset']);
?>

<?php $form = ActiveForm::begin([
    'id' => 'transaction-transfer',
    'action' => '/transaction/transfer'
]) ?>

<div class="row">
    <div class="col-md-12">
        <div class="well">

            <?= $form->field($model, 'fromAccountId')->widget(Select2::classname(), [
                'data' => AccountsHelper::getListAccounts(),
                'options' => [
                    'placeholder' => 'Выберите счет ...',
                ],
                'pluginEvents' => [
                    "select2:select" => 'function(e, object) {
                        var label = $("#select2-transferform-fromaccountid-container").text();
                        var valuta = label.split("(");
                        valuta = valuta[valuta.length - 1].split(")")[0];
                        $("#fromAmountLabel").text("Величина (" + valuta + ")*");
                        $("#commissionLabel").text("Комиссия (" + valuta + ")");
                    }',
                ]
            ]) ?>

            <?= $form->field($model, 'fromAmount')
                ->textInput()
                ->label('Величина (' . $firstValuta . ')*', [
                    'id' => 'fromAmountLabel'
                ]); ?>

            <?= $form->field($model, 'commission')
                ->textInput()
                ->label('Комиссия (' . $firstValuta . ')', [
                    'id' => 'commissionLabel'
                ]); ?>

        </div>
        <div class="well">

            <?= $form->field($model, 'toAccountId')->widget(Select2::classname(), [
                'data' => AccountsHelper::getListAccounts(),
                'options' => [
                    'placeholder' => 'Выберите счет ...',
                ],
                'pluginEvents' => [
                    "select2:select" => 'function(e, object) {
                        var label = $("#select2-transferform-toaccountid-container").text();
                        var valuta = label.split("(");
                        valuta = valuta[valuta.length - 1].split(")")[0];
                        $("#toAmountLabel").text("Величина (" + valuta + ")*");
                    }',
                ]
            ]) ?>

            <?= $form->field($model, 'toAmount')
                ->textInput()
                ->label('Величина (' . $firstValuta . ')*', [
                    'id' => 'toAmountLabel'
                ]); ?>

        </div>
    </div>
</div>

<div class="row transfer-info-block">
    <div class="col-md-12">

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

    </div>
</div>

<div class="row transfer-button-block form-actions">
    <div class="col-md-12">

        <?= Html::a('Отмена', Url::to(['/transaction']), ['class' => 'btn btn-default']); ?>

        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']); ?>

    </div>
</div>

<?php ActiveForm::end() ?>
