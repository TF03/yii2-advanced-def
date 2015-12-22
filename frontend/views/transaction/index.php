<?php

use yii\bootstrap\ButtonDropdown;

/** @var $this yii\web\View */

//http://yiibooster.clevertech.biz/widgets/forms_buttons/view/buttongroup.html

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
                    //'label' => '<a href="http://mybudget.ws/transactions/new">Новый Расход</a>',
                    //'encodeLabel' => false,
                    'options' => [
                        'class' => 'btn btn-success'
                    ],
                    'split'=>true,
                    'dropdown' => [
                        'items' => [
                            [
                                'label' => 'Новый расход',
                                'url' => '#'
                            ],
                            [
                                'label' => 'Новый доход',
                                'url' => '#'
                            ],
                            [
                                'label' => 'Новый перевод',
                                'url' => '#'
                            ]
                        ]
                    ]
                ]);
                ?>
            </div>
        </div>
    </div>
</div>