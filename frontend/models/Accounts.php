<?php

namespace frontend\models;

use Yii;

/**
 * @inheritdoc
 *
 */
class Accounts extends \common\models\Accounts
{
    public static function find()
    {
        return parent::find()->andWhere([
            'user_id' => Yii::$app->getUser()->id,
        ]);
    }
}
