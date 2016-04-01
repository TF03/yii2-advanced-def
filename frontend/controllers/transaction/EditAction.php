<?php

namespace frontend\controllers\transaction;

use frontend\helper\TransactionHelper;
use frontend\models\Accounts;
use frontend\models\Transaction;
use Yii;
use yii\base\Action;
use yii\web\NotFoundHttpException;

/**
 * Class EditAction
 * @package frontend\controllers\transaction
 */
class EditAction extends Action
{
    /**
     * Edits an existing Transaction model.
     * If edit is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function run($id)
    {
        /** @var Transaction $model */
        $model = $this->controller->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {

            $transaction2Category = '';
            if (isset(Yii::$app->request->post('Transaction')['categoryIds'])) {
                $transaction2Category = Yii::$app->request->post('Transaction')['categoryIds'];
            }

            if ($model->save()) {
                if (!empty($transaction2Category)) {
                    TransactionHelper::saveTransaction2Category($transaction2Category, $model->id);
                }
                Yii::$app->getSession()->setFlash('success', 'Транзакция изменена.');
                return $this->controller->redirect(['/transaction']);
            }
        }

        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();
        $model->categoryIds = $model->getTransaction2CategoryList();

        return $this->controller->render('_forms/_edit', [
            'model' => $model,
            'account' => $account,
        ]);
    }
}