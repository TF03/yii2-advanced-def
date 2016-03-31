<?php

namespace frontend\controllers;

use frontend\models\forms\TransferForm;
use frontend\models\search\TransactionSearch;
use frontend\helper\TransactionHelper;
use frontend\models\Accounts;
use frontend\models\Transaction;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\web\NotFoundHttpException;

/**
 * TransactionController implements the CRUD actions for Category model.
 */
class TransactionController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => [
                    'index',
                    'new',
                    'new-income',
                    'transfer',
                    'remove',
                    'edit'
                ],
                'rules' => [
                    [
                        'actions' => [
                            'index',
                            'new',
                            'new-income',
                            'transfer',
                            'remove',
                            'edit'
                        ],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'remove' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Transaction models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TransactionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Transaction model.
     * If creation is successful, the browser will be redirected to the 'index' page.
     * @return mixed
     */
    public function actionNew()
    {
        $model = new Transaction();
        $this->saveModel($model);
        $model->type_id = TransactionHelper::TYPE_EXPENSE;

        return $this->render('edit', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new Transaction model.
     * If creation is successful, the browser will be redirected to the 'index' page.
     * @return mixed
     */
    public function actionNewIncome()
    {
        $model = new Transaction();
        $this->saveModel($model);
        $model->type_id = TransactionHelper::TYPE_INCOME;

        return $this->render('edit', [
            'model' => $model,
        ]);
    }

    /**
     * @param Transaction $model
     *
     * @return \yii\web\Response
     */
    protected function saveModel($model)
    {
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {

            $transaction2Category = '';
            if (isset(Yii::$app->request->post('Transaction')['categoryIds'])) {
                $transaction2Category = Yii::$app->request->post('Transaction')['categoryIds'];
            }

            if ($model->save()) {
                if (!empty($transaction2Category)) {
                    TransactionHelper::saveTransaction2Category($transaction2Category, $model->id);
                }
                Yii::$app->getSession()->setFlash('success', 'Транзакция создана.');
                return $this->redirect(['index']);
            }
        }
    }

    /**
     * Removes an existing Transaction model.
     * If remove is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionRemove($id)
    {
        $model = $this->findModel($id);

        if ($model->delete()) {
            Yii::$app->getSession()->setFlash('success', 'Транзакция удалена.');
        } else {
            Yii::$app->getSession()->setFlash('error', 'При удалении произошла ошибка.');
        }

        return $this->redirect('/transaction');
    }

    /**
     * Edits an existing Transaction model.
     * If edit is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionEdit($id)
    {
        $model = $this->findModel($id);

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
                return $this->redirect(['/transaction']);
            }
        }

        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();
        $model->categoryIds = $model->getTransaction2CategoryList();

        return $this->render('edit', [
            'model' => $model,
            'account' => $account,
        ]);
    }

    public function actionTransfer()
    {
        $model = new TransferForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->fromAccountId != $model->toAccountId
                && $this->saveFromTransaction($model)
                && $this->saveToTransaction($model)) {

                Yii::$app->getSession()->setFlash('success', 'Перевод был произведен.');
                return $this->redirect(['/transaction']);
            } else {
                die;
            }
        }

        return $this->render('transfer', [
            'model' => $model,
        ]);
    }

    protected function saveFromTransaction($model)
    {
        $fromTransaction = new Transaction();
        $fromTransaction->setAttributes($model->attributes);
        $fromTransaction->accounts = $model->fromAccountId;
        $fromTransaction->amount = $model->fromAmount + (float) $model->commission;
        $fromTransaction->total = $model->fromTotal + (float) $model->commission;
        $fromTransaction->type_id = TransactionHelper::TYPE_EXPENSE;

        if ($fromTransaction->save()) {
            return true;
        } else {
            print_r($fromTransaction);
            return false;
        }
    }

    protected function saveToTransaction($model)
    {
        $toTransaction = new Transaction();
        $toTransaction->setAttributes($model->attributes);
        $toTransaction->accounts = $model->toAccountId;
        $toTransaction->amount = $model->toAmount;
        $toTransaction->total = $model->toTotal;
        $toTransaction->type_id = TransactionHelper::TYPE_INCOME;

        if ($toTransaction->save()) {
            return true;
        } else {
            print_r($toTransaction);
            return false;
        }
    }

    /**
     * Finds the Transaction model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Transaction the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Transaction::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}