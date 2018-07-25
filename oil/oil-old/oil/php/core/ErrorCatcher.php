<?php
    class ClassErrorCatcher
    {

        // массив ошибок, которые надо перехватывать
        // которые не обработаются пользовательской функцией
        private $arrayError = array(
                                'ERROR',
                                'PARSE',
                                'COMPILE_ERROR',
                                'CORE_ERROR'
        );

        // массив соотношения число ошибки - значение ошибки
        private $arrayErrorValue = array(
                                    '1'    => 'ERROR',
                                    '2'    => 'WARNING',
                                    '4'    => 'PARSE',
                                    '8'    => 'NOTICE',
                                    '16'   => 'CORE_ERROR',
                                    '32'   => 'CORE_WARNING',
                                    '64'   => 'COMPILE_ERROR',
                                    '128'  => 'COMPILE_WARNING',
                                    '256'  => 'USER_ERROR',
                                    '512'  => 'USER_WARNING',
                                    '1024' => 'USER_NOTICE'
        );

        // массив хранит все ошибки
        private $arrayErrorsInfo = array();

        // лог файл
        private $file_log = '';

        public function __construct() {

			$this->file_log = SITE_PATH . "log_error.txt";
            // считываем массив с лог файла
            $this->arrayErrorsInfo = unserialize(file_get_contents($this->file_log));
            //print_r($this->arrayErrorsInfo); die();

            // регистрация ошибок
            // установка пользовательской функции
            set_error_handler(array($this, 'OtherErrorCatcher'));

            // перехватываем критические ошибки
            register_shutdown_function(array($this, 'FatalErrorCatcher'));
        }

        public function OtherErrorCatcher($errorNum, $errorStr, $errorFile, $errorLine) {

            // записать в лог
            $errorNum = $this->ErrorValue($errorNum);
            $errorKey = md5($errorStr . $errorFile . $errorLine);
            if($errorNum != false
                && isset($errorStr)
                && !isset($this->arrayErrorsInfo[$errorKey]))
                $this->arrayErrorsInfo[$errorKey] = "$errorNum : $errorStr Файл - $errorFile Строка - $errorLine";

            // разкоментить, чтобы посмотреть
            // как выведет ошибку встроенный обработчик
            //return false;
        }

        public function FatalErrorCatcher() {

            $error = error_get_last();

            $error['type'] = $this->ErrorValue($error['type']);
            if(!empty($this->arrayErrorsInfo)) {
                if($error && in_array($error['type'], $this->arrayError)) {

                    // - записать в лог
                    if (is_writable($this->file_log)) {
                        $errorKey = md5($error['message'] . $error['type'] . $error['line']);

                        if(!isset($this->arrayErrorsInfo[$errorKey]))
                            $this->arrayErrorsInfo[$errorKey] = "$error[type] : $error[message] Файл - $error[type] Строка - $error[line]";

                        $content = serialize($this->arrayErrorsInfo);
                        if(file_put_contents($this->file_log, $content, LOCK_EX) === false)
                            echo "<script type=\"text/javascript\">console.log('Не могу произвести запись в файл ($this->file_log)');</script>";
                    }
                }
                else {

                    //сделать запись в лог
                    if (is_writable($this->file_log)) {

                        $content = serialize($this->arrayErrorsInfo);
                        if(file_put_contents($this->file_log, $content, LOCK_EX) === false)
                            echo "<script type=\"text/javascript\">console.log('Не могу произвести запись в файл ($this->file_log)');</script>";
                    }
                }
            }
        }

        /**
         * @param $errorNum(int) - значение ошибки
         * @return mixed
         */
        public function ErrorValue($errorNum) {

            if(isset($this->arrayErrorValue[$errorNum]))
                return $this->arrayErrorValue[$errorNum];
            else
                return false;
        }
		
        /**
		 * удаляем по ключу ошибку из лог файла
         * @param $key - ключ массива
         * @return bool
         */
        public function DeleteError($key) {

            if(isset($this->arrayErrorsInfo[$key])) {
                unset($this->arrayErrorsInfo[$key]);
                return true;
            }
            else    
                return false;
        }
    }