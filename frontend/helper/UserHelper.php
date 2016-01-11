<?php

namespace frontend\helper;

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
}