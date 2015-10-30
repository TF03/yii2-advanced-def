<?php

namespace frontend\controllers;

use app\frontend\models\Category;
use \yii\web\Controller;

class CategoryController extends Controller
{
    public function actionIndex()
    {
        $model = Category::findAll([]);

        $this->render('index', [
            'model' => $model
        ]);
    }
}