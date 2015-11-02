<?php

use yii\helpers\Html;

/**
 * @var $model \frontend\models\search\CategorySearch
 */

?>
<div class="col-md-12">

    <div class="col-md-8">
        <h1><?= Html::encode($model->title) ?></h1>
    </div>

    <div class="col-md-2">
        <p>
            <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
            <?= Html::a('Delete', ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => 'Are you sure you want to delete this item?',
                    'method' => 'post',
                ],
            ]) ?>
        </p>
    </div>

</div>