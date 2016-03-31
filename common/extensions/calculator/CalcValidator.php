<?php

namespace common\extensions\calculator;

use yii\validators\Validator;

/**
 * CalcValidator validator of math expression
 *
 * @package common\extensions
 */
class CalcValidator extends Validator
{
    /**
     * @var string attribute where you want to save the result of calculation
     */
    public $resultAttribute;

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        /*if ($this->message == null) {
            $this->message = 'Error in expression';
        }*/
    }

    /**
     * @inheritdoc
     */
    public function validateAttribute($object, $attribute)
    {
        $value = $object->$attribute;
        $result = $this->validateValue($value);
        if (!empty($result)) {
            $this->addError($object, $attribute, $result[0], $result[1]);
        } elseif ($this->resultAttribute !== null) {
            $calculator = new Calculator();
            $object->{$this->resultAttribute} = $calculator->calc($value);
        }
    }

    /**
     * @inheritdoc
     */
    protected function validateValue($value)
    {
        $valid = true;
        try {
            $calculator = new Calculator();
            $calculator->calc($value);
        } catch (CalculatorException $e) {
            $valid = false;
        }
        return $valid ? null : [$this->message, []];
    }
}