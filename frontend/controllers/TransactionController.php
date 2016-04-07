<?php

namespace frontend\controllers;

use frontend\models\forms\TransferForm;
use frontend\models\search\TransactionSearch;
use frontend\helper\TransactionHelper;
use frontend\models\Transaction;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\filters\VerbFilter;
use yii\web\NotFoundHttpException;

/**
 * TransactionController implements the CRUD actions for Category model.
 */
class TransactionController extends FrontendController
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
                    'edit',
                    'filter',
                    'account',
                    'category',
                ],
                'rules' => [
                    [
                        'actions' => [
                            'index',
                            'new',
                            'new-income',
                            'transfer',
                            'remove',
                            'edit',
                            'filter',
                            'account',
                            'category',
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

    public function actions()
    {
        return ArrayHelper::merge(parent::actions(), [
            'edit'      => 'frontend\controllers\transaction\EditAction',
            'transfer'  => 'frontend\controllers\transaction\TransferAction',
            'filter'    => 'frontend\controllers\transaction\FilterAction',
            'account'    => 'frontend\controllers\transaction\AccountAction',
            'category'    => 'frontend\controllers\transaction\CategoryAction',
        ]);
    }

    /**
     * Lists all Transaction models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = $this->getDataProviderForIndex();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * @param array $params
     * @return ActiveDataProvider
     */
    public function getDataProviderForIndex($params = [])
    {
        $searchModel = new TransactionSearch();
        $params = ArrayHelper::merge(Yii::$app->request->queryParams, $params);
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination->pageSize = 15;

        return $dataProvider;
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

        return $this->render('transaction', [
            'model' => $model,
            'modelTransfer' => new TransferForm()
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

        return $this->render('transaction', [
            'model' => $model,
            'modelTransfer' => new TransferForm()
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
     * Finds the Transaction model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Transaction the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function findModel($id)
    {
        if (($model = Transaction::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}