<?php

namespace frontend\controllers;

use frontend\helper\StatusHelper;
use Yii;
use frontend\models\Category;
use frontend\models\search\CategorySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends Controller
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
     * Lists all Category models.
     * @return mixed
     */
    public function actionIndex()
    {
        $idCategory = Yii::$app->request->post('Category');
        if ($idCategory) {
            $model = $this->findModel($idCategory['id']);
            $model->status = $model->getValueSaveStatus($idCategory['status']);
            $model->save();
        }

        $modelAll = Category::find()->all();

        return $this->render('index', [
            'modelAll' => $modelAll,
        ]);
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'index' page.
     * @return mixed
     */
    public function actionNew()
    {
        $model = new Category();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('new', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Edits an existing Category model.
     * If edit is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionEdit($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('edit', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Removes an existing Category model.
     * If remove is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionRemove($id)
    {
        $model = $this->findModel($id);
        $model->status = StatusHelper::STATUS_DELETE;

        if ($model->save()) {
            Yii::$app->getSession()->setFlash('success', 'Категория удалена.');
        }
        else {
            Yii::$app->getSession()->setFlash('error', 'При удалении произошла ошибка.');
        }

        return $this->redirect(['index']);
    }

    /**
     * @param integer $id
     * @return mixed
     */
    public function actionHiddenCategory($id)
    {

    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = Category::find()->andWhere(['id' => $id])->one();
        if ( $model !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Данная страница не найдена.');
        }
    }
}
