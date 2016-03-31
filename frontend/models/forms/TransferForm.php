<?php

namespace frontend\models\forms;

use common\extensions\calculator\CalcValidator;
use Yii;
use yii\base\Model;

/**
 * TransferForm is the model behind the contact form.
 */
class TransferForm extends Model
{
    public $fromAccountId;
    public $toAccountId;
    public $date;
    public $fromAmount;
    public $commission;
    public $fromTotal;
    public $toAmount;
    public $toTotal;
    public $comment;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fromAccountId', 'toAccountId', 'fromAmount', 'toAmount'], 'required'],
            [['fromAccountId', 'toAccountId', 'commission'], 'integer'],
            [['comment', 'fromAmount', 'toAmount'], 'string', 'max' => 255],
            [['date'], 'string', 'max' => 16],
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
            'date' => 'Дата',
            'comment' => 'Примечание',
            'commission' => 'Коммиссия',
            'fromTotal' => 'Величина',
            'toTotal' => 'Величина',
        ];
    }
}
