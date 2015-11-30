<?php

namespace frontend\controllers;

use frontend\helper\StatusHelper;
use Yii;
use frontend\models\Category;
use frontend\models\search\CategorySearch;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends FrontendController
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'new', 'remove', 'edit', 'hiddenCategory'],
                'rules' => [
                    [
                        'actions' => ['index', 'new', 'remove', 'edit', 'hiddenCategory'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
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

        return $this->renderIndex();
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

        if ( isset($model->base_category_id) ) {
            Yii::$app->getSession()->setFlash('error', 'Эта категория не может быть удалена.');
        }
        else {
            $model->status = StatusHelper::STATUS_DELETE;

            if ($model->save()) {
                Yii::$app->getSession()->setFlash('success', 'Категория удалена.');
            } else {
                Yii::$app->getSession()->setFlash('error', 'При удалении произошла ошибка.');
            }
        }

        return $this->renderIndex();
    }

    /**
     * @param integer $id
     * @return mixed
     */
    public function actionHiddenCategory($id)
    {
        $model = $this->findModel($id);
        $model->status = StatusHelper::getChangeStatus($model->status);

        if ($model->save()) {
            return true;
        }
        else {
            return false;
        }
    }

    /**
     * @return mixed
     */
    public function actionSortCategory()
    {
        $sort = Yii::$app->request->post('sort');

        if (isset($sort)) {
            $i = 1;
            $sort = explode(',', $sort);

            $models = Category::find()->where(['id' => $sort])
                ->orderBy(['FIELD (`id`, '.implode(',',$sort).')'=>''])
                ->all();

            /**
             * @var $model Category
             */
            foreach ($models as $model) {
                $model->position = $i++;
                if (!$model->save()) {
                    Yii::$app->getSession()->setFlash('error', 'Во время сортировки произошла ошибка!');

                    return false;
                }
            }

            return true;
        }
        else {
            return false;
        }
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

    protected function renderIndex()
    {
        $modelAll = Category::find()->orderBy('position')->all();

        return $this->render('index', [
            'modelAll' => $modelAll,
        ]);
    }
}
