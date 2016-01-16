<?php

namespace frontend\models;

use Yii;

/**
 * @inheritdoc
 *
 */
class Transaction extends \common\models\Transaction
{
    public static function find()
    {
        return parent::find()
            ->andWhere([
                           'user_id' => Yii::$app->getUser()->id
                       ]);
    }
}
