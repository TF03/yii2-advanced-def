<?php

namespace frontend\models\forms;

use common\extensions\calculator\CalcValidator;
use Yii;
use yii\base\Model;

/**
 * SaveOnTargetForm is the model behind the save on target form.
 */
class SaveOnTargetForm extends Model
{
    public $fromAccountId;
    public $fromAmount;
    public $fromTotal;
    public $toTargetId;
    public $toAmount;
    public $toTotal;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fromAccountId', 'toTargetId', 'fromAmount', 'toAmount'], 'required'],
            [['fromAccountId', 'toTargetId'], 'integer'],
            [['fromAmount', 'toAmount'], 'string', 'max' => 255],
            ['fromAmount', CalcValidator::className(), 'resultAttribute' => 'fromTotal'],
            ['toAmount', CalcValidator::className(), 'resultAttribute' => 'toTotal']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'fromAccountId' => 'Со счета',
            'toAccountId' => 'На счет',
            'toTargetId' => 'На цель',
            'fromTotal' => 'Величина',
            'toTotal' => 'Величина',
        ];
    }
}
