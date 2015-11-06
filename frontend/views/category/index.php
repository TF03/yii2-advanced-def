<?php

use kartik\sortable\Sortable;
use yii\helpers\Html;

/* @var $modelAll frontend\models\Category */

$this->title = 'Категории';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

    <p>
        <?= Html::a('Новая категория', ['new'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= Sortable::widget([
        'items' => $modelAll
    ]);
    ?>

</div>
