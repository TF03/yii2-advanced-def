<?php

use common\widgets\Alert;
use frontend\helper\AccountsHelper;
use frontend\helper\TargetHelper;
use kartik\select2\Select2;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var $this yii\web\View */
/** @var $model \frontend\models\forms\SaveOnTargetForm */

$this->title = 'Отложить средства';
$this->params['breadcrumbs'][] = ['label' => 'Цели', 'url' => ['/targets']];
$this->params['breadcrumbs'][] = $this->title;

$firstValuta = AccountsHelper::getFirstValuta();

//$this->registerJsFile('/js/frontend/views/transaction/transfer.js', ['depends' => 'frontend\assets\BackboneAsset']);
?>

<?= Alert::widget() ?>

<?php $form = ActiveForm::begin([
    'id' => 'save-on-target'
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
                ->label('Величина*', [
                    'id' => 'fromAmountLabel'
                ]); ?>
        </div>
        <div class="well">

            <?= $form->field($model, 'toTargetId')->widget(Select2::classname(), [
                'data' => TargetHelper::getListTargets(),
                'options' => [
                    'placeholder' => 'Выберите цель ...',
                ],
                'pluginEvents' => []
            ]) ?>

            <?= $form->field($model, 'toAmount')
                ->textInput()
                ->label('Величина*', [
                    'id' => 'toAmountLabel'
                ]); ?>

        </div>
    </div>
</div>

<div class="row transfer-button-block form-actions">
    <div class="col-md-12">

        <?= Html::a('Отмена', Url::to(['/transaction']), ['class' => 'btn btn-default']); ?>

        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']); ?>

    </div>
</div>

<?php ActiveForm::end() ?>
