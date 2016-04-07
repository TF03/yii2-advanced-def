<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\Targets */

$this->title = 'Новая цель';
$this->params['breadcrumbs'][] = ['label' => 'Цели', 'url' => ['/targets']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="targets-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
