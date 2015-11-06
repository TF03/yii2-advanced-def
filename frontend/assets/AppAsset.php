<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

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
        'js/global_ajax_spinner.js',
        'http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js',
        'js/classie.js',
        'js/cbpAnimatedHeader.js',
        'js/jqBootstrapValidation.js',
        'js/contact_me.js',
        'js/budget.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
