<?php

namespace common\models;

use common\models\gii\CurrencyGii;
use frontend\helper\StatusHelper;
use Yii;
use yii\db\ActiveQuery;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property CurrencyBase $baseCurrency
 */
class Currency extends CurrencyGii
{
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOwner()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBaseCurrency()
    {
        return $this->hasOne(CurrencyBase::className(), ['id' => 'base_currency_id']);
    }

    /**
     * @return ActiveQuery the newly created [[ActiveQuery]] instance.
     */
    public static function findActual()
    {
        return parent::find()->andWhere([
            'user_id' => Yii::$app->getUser()->id,
            'status' => StatusHelper::STATUS_AVAILABLE
        ]);
    }
}
