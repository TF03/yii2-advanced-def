<?php

namespace frontend\helper;

use common\models\Currency;
use frontend\models\User;

class UserHelper
{
    /**
     * @param integer $id
     *
     * @return array|boolean
     */
    public static function getCurrentUser($id)
    {
        /** @var $user User */
        $user = User::findOne(['id' => $id]);
        if (isset($user)) {
            return $user;
        }

        return false;
    }

    /**
     * @param integer $id
     *
     * @return string|boolean
     */
    public static function getCurrentUserName($id)
    {
        /** @var $user User */
        $user = self::getCurrentUser($id);
        if (isset($user)) {
            return $user->username;
        }

        return false;
    }

    /**
     * Get List Currency for Current User
     *
     * @return array
     */
    public static function getCurrentListCurrency()
    {
        $result = [];
        $currencies = Currency::findActual()->all();
        if (isset($currencies)) {
            foreach ($currencies as $currency) {
                /** @var $currency Currency */
                $result[$currency->id] = $currency->title;
            }
        }

        return $result;
    }
}