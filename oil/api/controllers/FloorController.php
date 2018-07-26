<?php

namespace api\controllers;

use api\traits\AjaxJsonSendTrait;
use common\models\Floor;
use yii\web\Controller;

class FloorController extends Controller
{
    use AjaxJsonSendTrait;

    /**
     * Return floors list
     *
     * @param null $houseId
     *
     * @return mixed
     * @throws \yii\base\ExitException
     */
    public function actionList($houseId = null)
    {
        $result = [
            'status' => 200,
            'data' => []
        ];
        $floors = Floor::find();
        if ($houseId) {
            $floors->where(['houseId' => $houseId]);
        }
        $floors = $floors->all();

        /** @var Floor $floor */
        foreach ($floors as $floor) {
            $result['data'][] = $floor->toArray();
        }

        return $this->performAjaxValidation($result, false);
    }
}