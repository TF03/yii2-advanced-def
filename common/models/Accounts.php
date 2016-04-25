<?php

namespace common\models;

use common\models\gii\AccountsGii;
use Yii;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property Currency $currency
 * @property string | boolean $valuta
 */
class Accounts extends AccountsGii
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
    public function getCurrency()
    {
        return $this->hasOne(Currency::className(), ['id' => 'currencyId']);
    }

    /**
     * @return string | boolean
     */
    public function getValuta()
    {
        $currentCurrency = $this->currency;
        if ($currentCurrency) {
            return $currentCurrency->title;
        } else {
            return false;
        }
    }
}
