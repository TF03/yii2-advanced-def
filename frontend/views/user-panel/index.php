<?php

/**
 * @var $this yii\web\View
 * @var
 */

$this->title = 'Settings page';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>You settings page!</h1>
        <p class="lead">Hi, <?= Yii::$app->user->identity->username; ?>!</p>
    </div>
</div>
