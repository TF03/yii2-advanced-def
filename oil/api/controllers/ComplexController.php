<?php

namespace api\controllers;

use api\traits\AjaxJsonSendTrait;
use common\models\Complex;
use yii\web\Controller;

class ComplexController extends Controller
{
    use AjaxJsonSendTrait;

    /**
     * Return complex list
     *
     * @return mixed
     */
    public function actionList()
    {
        $result = [
            'status' => 200,
            'data' => []
        ];
        $complexes = Complex::find()->all();
        /** @var Complex $complex */
        foreach ($complexes as $complex) {
            $result['data'][] = $complex->toArray();
        }

        return $this->performAjaxValidation($result, false);
    }
}