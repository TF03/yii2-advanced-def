<?php

namespace api\controllers;

use api\traits\AjaxJsonSendTrait;
use common\models\House;
use yii\web\Controller;

class HouseController extends Controller
{
    use AjaxJsonSendTrait;

    /**
     * Return houses list
     *
     * @param null $complexId
     *
     * @return mixed
     * @throws \yii\base\ExitException
     */
    public function actionList($complexId = null)
    {
        $result = [
            'status' => 200,
            'data' => []
        ];
        $houses = House::find();
        if ($complexId) {
            $houses->where(['complexId' => $complexId]);
        }
        $houses = $houses->all();

        /** @var House $house */
        foreach ($houses as $house) {
            $result['data'][] = $house->toArray();
        }

        return $this->performAjaxValidation($result, false);
    }
}