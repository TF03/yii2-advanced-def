<?php

use yii\bootstrap\Button;
use yii\bootstrap\ButtonGroup;

/** @var $this yii\web\View */

//http://yiibooster.clevertech.biz/widgets/forms_buttons/view/buttongroup.html

?>

<div class="row transaction">
    <div class="col-md-2">
        <?php echo $this->render('_filter', [], true);?>
    </div>
    <div class="col-md-10">
        <div>
            <?=
                ButtonGroup::widget([
                    'encodeLabels' => false,
                    'buttons' => [
                        ['label' => 'A'],
                        ['label' => 'B'],
                        ['label' => 'C', 'visible' => false],
                    ],
                    'options' => [
                        'id' => false,
                        'title' => 'Новая запись'
                    ]
                ]);
            ?>
            <?=
                ButtonGroup::widget([
                    'buttons' => [
                        Button::widget(['label' => 'A']),
                        ['label' => 'B'],
                    ]
                ]);
            ?>
        </div>
    </div>
</div>