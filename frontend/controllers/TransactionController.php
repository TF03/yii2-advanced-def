<?php

namespace frontend\controllers;

use frontend\helper\TransactionHelper;
use frontend\models\Transaction;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;

/**
 * TransactionController implements the CRUD actions for Category model.
 */
class TransactionController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
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

        return $this->render('index', [
            //'searchModel' => $searchModel,
            //'dataProvider' => $dataProvider,
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
            if (isset(Yii::$app->request->post('Transaction')['transaction2Category'])) {
                $transaction2Category = Yii::$app->request->post('Transaction')['transaction2Category'];
            }

            if ($model->save()) {
                TransactionHelper::saveTransaction2Category($transaction2Category, $model->id);
                Yii::$app->getSession()->setFlash('success', 'Транзакция создана.');
                return $this->redirect(['index']);
            }
        }

        return $this->render('new', [
            'model' => $model,
        ]);
    }

}