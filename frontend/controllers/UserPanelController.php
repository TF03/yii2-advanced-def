<?php

namespace frontend\controllers;

use yii\filters\VerbFilter;

/**
 * User Panel controller
 */
class UserPanelController extends FrontendController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
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