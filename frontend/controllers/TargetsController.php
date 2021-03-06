<?php

namespace frontend\controllers;

use frontend\models\Accounts;
use frontend\models\forms\SaveOnTargetForm;
use Yii;
use frontend\models\Targets;
use frontend\models\search\TargetsSearch;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TargetsController implements the CRUD actions for Targets model.
 */
class TargetsController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'new'],
                'rules' => [
                    [
                        'actions' => ['index', 'new', 'remove', 'update', 'save-on-target'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Targets models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TargetsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Targets model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionNew()
    {
        $model = new Targets();

        if ($model->load(Yii::$app->request->post())) {
            $model->order = ($model->order != null) ? $model->order : 0;
            if ($model->save()) {
                return $this->redirect(['/targets']);
            }
        }

        return $this->render('new', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Targets model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['/targets']);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Targets model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionRemove($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionSaveOnTarget()
    {
        $model = new SaveOnTargetForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            /** @var Targets $target */
            $target = Targets::findOne(['id' => $model->toTargetId]);
            /** @var Accounts $account */
            $account = Accounts::findOne(['id' => $model->fromAccountId]);
            if ($target && $account) {
                $target->balance = str_replace(' ', '', $target->balance);
                $target->balance = bcadd($target->balance, $model->toAmount, 2);
                $account->amount = bcsub($account->amount, $model->fromTotal, 2);
                $transaction = Yii::$app->getDb()->beginTransaction();
                try {
                    if ($account->save() && $target->save()) {
                        $transaction->commit();
                        Yii::$app->getSession()->setFlash('success', 'Средства были отложены.');
                        return $this->redirect(['/targets']);
                    } else {
                        $transaction->rollback();
                    }
                } catch (\Exception $e) {
                    $transaction->rollback();
                }
            }
        }

        return $this->render('save-on-target', [
            'model' => $model,
        ]);
    }

    /**
     * Finds the Targets model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Targets the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Targets::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
