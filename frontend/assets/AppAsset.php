<?php

namespace frontend\assets;

use yii;
use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/bootstrap.min.css',
        'css/budget.css',
        'font-awesome/css/font-awesome.min.css',
        'http://fonts.googleapis.com/css?family=Montserrat:400,700',
        'http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic',
        //'css/main.css',
    ];
    public $js = [
        'http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js',
        'js/libs/classie/classie.js',
        'js/libs/cbpAnimatedHeader/cbpAnimatedHeader.js',
        'js/libs/jqBootstrapValidation/jqBootstrapValidation.js',

        'js/frontend/budget.js',
        'js/frontend/global_ajax_spinner.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
        'frontend\assets\ConfirmAlertAsset',
    ];
}
