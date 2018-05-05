<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\models\Targets */

$this->title = 'Update Targets: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Цели', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Редактирование - ' . $model->name;
?>
<div class="targets-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
