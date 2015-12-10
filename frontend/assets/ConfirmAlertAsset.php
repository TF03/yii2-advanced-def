<?php

namespace frontend\assets;

use yii\web\AssetBundle;
use Yii;

class ConfirmAlertAsset extends AssetBundle
{
    public $sourcePath = '@vendor/bower/bootbox';
    public $js = [
        'bootbox.js',
    ];

    /**
     * Initializes the bundle.
     * If you override this method, make sure you call the parent implementation in the last.
     */
    public function init()
    {
        parent::init();
    }

    public static function overrideSystemConfirm()
    {
        Yii::$app->view->registerJs('
            yii.confirm = function(message, ok, cancel) {
                bootbox.confirm(message, function(result) {
                    if (result) { !ok || ok(); } else { !cancel || cancel(); }
                });
            }
            /*yii.confirm = function(message, ok, cancel) {
                bootbox.confirm({
                    message: message,
                    callback: function(result) {
                        if (result) { !ok || ok(); } else { !cancel || cancel(); }
                    },
                    className: "modal-sidelib modal-sidelib-delete",
                    buttons: {
                        confirm: {
                          label: "ok",
                          className: "btn-primary btn-text-upper",
                          callback: function() {}
                        },
                        cancel: {
                          label: "cancel",
                          className: "btn-alt-cancel btn-text-upper",
                          callback: function() {}
                        },
                    }
                })
            }*/
        ');
    }
}
