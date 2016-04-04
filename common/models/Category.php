<?php

namespace common\models;

use common\behaviors\DeleteTransaction2CategoryBehavior;
use common\models\gii\CategoryGii;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property CategoryBase $baseCategory
 */
class Category extends CategoryGii
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            DeleteTransaction2CategoryBehavior::className(),
        ]);
    }

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
    public function getBaseCategory()
    {
        return $this->hasOne(CategoryBase::className(), ['id' => 'base_category_id']);
    }
}
