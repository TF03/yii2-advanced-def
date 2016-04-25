<?php

namespace console\helper;

use common\models\Currency;
use common\models\CurrencyBase;
use common\models\User;
use Yii;

/**
 * Class CurrencyCreateForUsersHelper
 * @package console\helper
 */
class CurrencyCreateForUsersHelper
{
    public static function createNewCurrency()
    {
        $currencyBases = CurrencyBase::find()->all();

        foreach (User::find()->batch() as $users) {
            /** @var User $user */
            foreach ($users as $user) {
                /** @var CurrencyBase $currencyBase */
                foreach ($currencyBases as $currencyBase) {
                    self::saveCurrencyByCurrencyBase($currencyBase, $user->id);
                }
            }
        }
    }

    /**
     * @param $userId
     *
     * @return bool
     * @throws \yii\db\Exception
     */
    public static function createBaseCurrencyForUser($userId)
    {
        $transaction = Yii::$app->getDb()->beginTransaction();
        try {
            $currencyBases = CurrencyBase::find()->all();

            /** @var CurrencyBase $currencyBase */
            foreach ($currencyBases as $currencyBase) {
                self::saveCurrencyByCurrencyBase($currencyBase, $userId);
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            return false;
        }
    }

    /**
     * @param CurrencyBase $currencyBase
     * @param integer $userId
     */
    protected static function saveCurrencyByCurrencyBase($currencyBase, $userId)
    {
        $currency = new Currency();

        $currency->title = $currencyBase->name;
        $currency->user_id = $userId;
        $currency->base_currency_id = $currencyBase->id;

        $currency->save();
    }
}
