<?php

namespace api\controllers;

use api\traits\AjaxJsonSendTrait;
use common\models\Apartment;
use yii\web\Controller;

class ApartmentController extends Controller
{
    use AjaxJsonSendTrait;

    /**
     * Return apartments list
     *
     * @param null $floorId
     *
     * @return mixed
     * @throws \yii\base\ExitException
     */
    public function actionList($floorId = null)
    {
        $result = [
            'status' => 200,
            'data' => []
        ];
        $apartments = Apartment::find();
        if ($floorId) {
            $apartments->where(['floorId' => $floorId]);
        }
        $apartments = $apartments->all();

        /** @var Apartment $apartment */
        foreach ($apartments as $apartment) {
            $result['data'][] = $apartment->toArray();
        }

        return $this->performAjaxValidation($result, false);
    }
}