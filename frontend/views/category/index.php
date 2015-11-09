<?php

use kartik\sortable\Sortable;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $modelAll frontend\models\Category */

$this->title = 'Категории';
$this->params['breadcrumbs'][] = $this->title;

$list = [];
foreach ($modelAll as $id => $title) {
    $list[] = [
        'content' => '<div>' . $title . '</div>' . Html::checkbox('status', true, [
                'title' => 'Отображать',
                'pjax' => true
            ]) . Html::a('Удалить', Yii::$app->urlManager->createUrl('category/index', ['id' => $id])),
        'options' => [
            'data-iCat' => $id
        ]
    ];
}

?>
<div class="category-index">

    <p>
        <?= Html::a('Новая категория', ['new'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin([
        'enablePushState' => false
      ]); ?>

        <?= Sortable::widget([
            'items' => $list,
            'pluginEvents' => [

            ]
        ]);
        ?>

    <?php Pjax::end(); ?>

</div>

<?= Html::a('Mark All As Read', ['/notification/default/mark-as-read'], [
    'class' => 'btn btn-default btn-text-upper btn-mark',
]); ?>