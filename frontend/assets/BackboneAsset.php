<?php

namespace frontend\assets;

use yii;
use yii\web\AssetBundle;
use yii\web\View;

class BackboneAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $js = [
        'js/libs/underscore/underscore-min.js',
        'js/libs/backbone/backbone-min.js',
        'js/frontend/core.js',
    ];
    public $depends = [
        'frontend\assets\AppAsset'
    ];

    /**
     * Initializes the bundle.
     * If you override this method, make sure you call the parent implementation in the last.
     */
    public function init()
    {
        parent::init();
        $this->registerBudgetFE();
    }

    private function registerBudgetFE()
    {
        Yii::$app->view->registerJs('
            BudgetFE = {};
            BudgetFE.widgets = {};
            BudgetFE.view = null;
            BudgetFE.url = {
                test: "' . Yii::$app->urlManager->createUrl('/transaction/testAjax') . '"
            };
        ', View::POS_BEGIN);
    }
}
