<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Accounts */

$this->title = 'Редактирование счета: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Счета', 'url' => ['/accounts']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accounts-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
