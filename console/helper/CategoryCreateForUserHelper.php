<?php

namespace console\helper;

use common\models\Category;
use common\models\CategoryBase;
use common\models\User;
use Yii;

/**
 * Class CategoryCreateForUserHelper
 * @package console\helper
 */
class CategoryCreateForUserHelper
{
    public static function createNewCategory()
    {
        $categoryBases = CategoryBase::find()->all();

        foreach (User::find()->batch() as $users) {
            /** @var User $user */
            foreach ($users as $user) {
                /** @var CategoryBase $categoryBase */
                foreach ($categoryBases as $categoryBase) {
                    $category = new Category();

                    $category->title = $categoryBase->name;
                    $category->user_id = $user->id;
                    $category->base_category_id = $categoryBase->id;

                    $category->save();
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
    public static function createBaseCategoryForUser($userId)
    {
        $transaction = Yii::$app->getDb()->beginTransaction();
        try {
            $categoryBases = CategoryBase::find()->all();

            /** @var CategoryBase $categoryBase */
            foreach ($categoryBases as $categoryBase) {
                $category = new Category();

                $category->title = $categoryBase->name;
                $category->user_id = $userId;
                $category->base_category_id = $categoryBase->id;

                $category->save();
            }
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            return false;
        }
    }
}