<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\bootstrap\NavBar;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use frontend\widgets\menus\MenusWidget;
use frontend\assets\BackboneAsset;

AppAsset::register($this);
BackboneAsset::register($this);
//ConfirmAlertAsset::overrideSystemConfirm();

/** @var yii\web\Controller $controller */
$controller = $this->context;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>

        <!-- Custom Fonts -->
        <!--link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
              type="text/css"-->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
<body id="page-top" class="index">
<?php $this->beginBody() ?>

<!-- Navigation -->
<!-- Collect the nav links, forms, and other content for toggling -->
<?php NavBar::begin([
    'brandLabel' => 'EasyBudget',
    'brandUrl' => (Yii::$app->request->url == Yii::$app->homeUrl) ? '#page-top' : '/',
    'options' => [
        'class' => 'navbar navbar-default navbar-fixed-top'
    ],
    'brandOptions' => [
        'class' => 'navbar-brand project-label'
    ]
]); ?>

<?= MenusWidget::widget(['controller' => $controller]); ?>

<?php NavBar::end(); ?>
<!--/nav-->

<div class="main-container container">
    <?= Breadcrumbs::widget([
                                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                            ]) ?>

    <?= $content ?>
</div>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-top page-scroll visible-xs visible-sm">
    <a class="btn btn-primary" href="#page-top">
        <i class="fa fa-chevron-up"></i>
    </a>
</div>

<div class="spinner"></div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>