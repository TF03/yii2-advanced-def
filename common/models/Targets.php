<?php

namespace common\models;

use common\behaviors\SetPropertyForTargetsBehavior;
use common\models\gii\TargetsGii;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\helpers\ArrayHelper;

/**
 * @inheritdoc
 *
 * @property User $owner
 */
class Targets extends TargetsGii
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return ArrayHelper::merge(parent::rules(), [

        ]);
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            [
                'class' => TimestampBehavior::className(),
                'value' => new Expression('NOW()'),
            ],
            SetPropertyForTargetsBehavior::className()
            //DeleteTransaction2CategoryBehavior::className(),
        ]);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOwner()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
