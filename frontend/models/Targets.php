<?php

namespace frontend\models;

use Yii;

/**
 * @inheritdoc
 */
class Targets extends \common\models\Targets
{
    public static function find()
    {
        return parent::find()->andWhere([
            'user_id' => Yii::$app->getUser()->id,
        ]);
    }
}
