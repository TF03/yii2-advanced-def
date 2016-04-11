<?php

namespace frontend\widgets\menus;

use yii;
use yii\bootstrap\Nav;
use yii\bootstrap\Widget;

/**
 * @property \yii\web\Controller $controller
 */
class MenusWidget extends Widget
{
    public $controller = '';

    /**
     * Initializes the widget.
     * This method will register the bootstrap asset bundle. If you override this method,
     * make sure you call the parent implementation first.
     */
    public function init()
    {
        parent::init();
    }

    /**
     * Render the widget.
     */
    public function run()
    {
        $menuItems = [];
        if (Yii::$app->user->isGuest) {
            $menuItems[] = ['label' => 'Регистрация', 'url' => ['/site/signup']];
            $menuItems[] = ['label' => 'Войти', 'url' => ['/site/login']];
        } else {
            $menuItems[] = [
                'label' => 'Счета',
                'url' => ['/accounts'],
                'active' => $this->controller->id === 'accounts'];
            $menuItems[] = [
                'label' => 'Операции',
                'url' => ['/transaction'],
                'active' => $this->controller->id === 'transaction'];
            $menuItems[] = [
                'label' => 'Цели',
                'url' => ['/targets'],
                'active' => $this->controller->id === 'targets'];
            $menuItems[] = [
                'label' => 'Категории',
                'url' => ['/category'],
                'active' => $this->controller->id === 'category'];
            $menuItems[] = [
                'label' => Yii::$app->user->identity->username,
                'items' => [
                    [
                        'label' => 'Профиль',
                        'url' => ['/user-panel/settings']
                    ],
                    [
                        'label' => 'Выход',
                        'url' => ['/site/logout'],
                        'linkOptions' => ['data-method' => 'post']
                    ],
                ]

            ];
        }
        $menus = Nav::widget([
            'options' => ['class' => 'nav navbar-nav navbar-right'],
            'items' => $menuItems,
        ]);
        return $HTML = <<< HTML
                {$menus}
HTML;
    }
}