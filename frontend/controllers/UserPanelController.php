<?php

namespace frontend\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;

/**
 * User Panel controller
 */
class UserPanelController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['settings'],
                'rules' => [
                    [
                        'actions' => ['settings'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    /**
     *
     * @return mixed
     */
    public function actionSettings()
    {
        return $this->render('index');
    }
}