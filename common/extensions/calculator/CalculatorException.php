<?php

namespace common\extensions\calculator;

/**
 * Calculator exception
 *
 * @package common\extensions
 */
class CalculatorException extends \Exception
{
    const SYNTAX_ERROR = 1;
    const UNKNOWN_OPERATION = 2;
    const DIV_BY_ZERO = 3;
}