<?php

namespace frontend\controllers;

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
                'only' => ['index', 'new', 'remove', 'edit'],
                'rules' => [
                    [
                        'actions' => ['index', 'new', 'remove', 'edit'],
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

        $model->type_id = TransactionHelper::TYPE_EXPENSE;

        return $this->render('new', [
            'model' => $model,
        ]);
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