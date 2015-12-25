<?php

use yii\helpers\Html;
use yii\bootstrap\ButtonDropdown;

/** @var $this yii\web\View */

$this->title = 'Операции';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="row">

    <div class="col-md-12 transaction">
        <div class="col-md-2">
            <?php echo $this->render('_filter', [], true); ?>
        </div>
        <div class="col-md-10">
            <div>
                <?=
                ButtonDropdown::widget([
                    'label' => 'Новый расход',
                    'tagName' => 'a',
                    'options' => [
                        'class' => 'btn-sm btn-success',
                        'href' => Yii::$app->urlManager->createUrl(['transaction/new']),
                    ],
                    'split'=>true,
                    'dropdown' => [
                        'items' => [
                            [
                                'label' => 'Новый расход',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/new'])
                            ],
                            [
                                'label' => 'Новый доход',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/new', 'type' => 'income'])
                            ],
                            [
                                'label' => 'Новый перевод',
                                'url' => Yii::$app->urlManager->createUrl(['transaction/transfer'])
                            ]
                        ]
                    ]
                ]);
                ?>
            </div>
        </div>
    </div>
</div>