<?php

namespace frontend\controllers\transaction;

use frontend\helper\TransactionHelper;
use frontend\models\Category;
use Yii;
use yii\base\Action;
use yii\web\NotFoundHttpException;

/**
 * Class CategoryAction
 * @package frontend\controllers\transaction
 */
class CategoryAction extends Action
{
    /**
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function run($id)
    {
        $category = Category::findOne(['id' => $id]);

        if (!empty($category)) {
            $param = [
                'category' => $id
            ];
            $extraOptions = [
                'filterEnable' => true
            ];

            return $this->controller->renderIndex($param, $extraOptions);
        } else {
            $this->controller->redirect(['/transaction']);
        }
    }
}