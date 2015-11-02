<?php

namespace common\models;

use common\models\gii\CategoryGii;
use Yii;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property CategoryBase $baseCategory
 */
class Category extends CategoryGii
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
    public function getBaseCategory()
    {
        return $this->hasOne(CategoryBase::className(), ['id' => 'base_category_id']);
    }
}
