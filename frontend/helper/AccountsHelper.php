<?php

namespace frontend\helper;

use frontend\models\Accounts;

class AccountsHelper
{
    /**
     * @return array|boolean
     */
    public static function getFirstValuta()
    {
        /** @var $account Accounts */
        $account = Accounts::find()->one();
        if (isset($account)) {
            return $account->valuta;
        }

        return false;
    }
    /**
     * @return array|boolean
     */
    public static function getFirstAccountId()
    {
        /** @var $account Accounts */
        $account = Accounts::find()->one();
        if (isset($account)) {
            return $account->id;
        }

        return false;
    }

    /**
     * @return array
     */
    public static function getListAccounts()
    {
        $result = [];

        $accounts = Accounts::find()->orderBy('sort')->all();
        if (isset($accounts)) {
            foreach ($accounts as $account) {
                /** @var $account Accounts */
                $result[$account->id] = $account->name . ' (' . $account->valuta . ')';
            }
        }

        return $result;
    }
}