<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;

/**
 * Chart controller
 */
class ChartController extends Controller
{

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout = 'mainIndex';

        return $this->render('index');
    }
}