<?php

namespace frontend\models\search;

use common\enums\PeriodFilterEnum;
use common\models\Transaction2Category;
use frontend\helper\TransactionHelper;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Transaction;
use yii\db\Query;

/**
 * TransactionSearch represents the model behind the search form about `frontend\models\Transaction`.
 */
class TransactionSearch extends Transaction
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'accounts', 'user_id', 'type_id', 'status'], 'integer'],
            [['comment', 'created_at', 'date'], 'safe'],
            [['amount'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Transaction::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            /*'pagination' => [
                'pageSize' => 15,
            ],*/
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'amount' => $this->amount,
            'accounts' => $this->accounts,
            'user_id' => $this->user_id,
            'type_id' => $this->type_id,
            'status' => $this->status,
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['like', 'comment', $this->comment])
            ->andFilterWhere(['like', 'date', $this->date]);

        $query = $this->additionalFilter($query, $params);

        return $dataProvider;
    }

    /**
     * @param Query $query
     * @param array $params
     * @return Query
     */
    protected function additionalFilter($query, $params)
    {
        if (!isset($params['sort'])) {
            $query->orderBy([
                'date' => SORT_DESC,
                'created_at' => SORT_DESC,
                'id' => SORT_DESC
            ]);
        } else {
            switch ($params['sort']) {
                case 'total':
                    $query->orderBy([
                        'type_id' => SORT_DESC,
                        'total' => SORT_ASC
                    ]);
                    break;
                case '-total':
                    $query->orderBy([
                        'type_id' => SORT_ASC,
                        'total' => SORT_DESC
                    ]);
                    break;
            }
        }

        $period = Yii::$app->request->get('period');
        if (isset($period)) {
            switch($period) {
                case PeriodFilterEnum::TODAY:
                    $today = Yii::$app->getFormatter()->asDate('now', "php:Y-m-d");
                    $query->andFilterWhere(['like', 'date', $today]);
                    break;
                case PeriodFilterEnum::YESTERDAY:
                    $yesterday = date('Y-m-d', strtotime(date('Y-m-d') . " - 1 day"));
                    $query->andFilterWhere(['like', 'date', $yesterday]);
                    break;
                case PeriodFilterEnum::CUSTOM:
                    $periodFrom = Yii::$app->request->get('periodFrom');
                    if (empty($periodFrom)) {
                        $periodFrom = Yii::$app->getFormatter()->asDate('now', "php:Y-m-d");
                    } else {
                        $periodFrom = date('Y-m-d', strtotime($periodFrom));
                    }
                    $periodTo = Yii::$app->request->get('periodTo');
                    if (empty($periodTo)) {
                        $periodTo = Yii::$app->getFormatter()->asDate('now', "php:Y-m-d");
                    } else {
                        $periodTo = date('Y-m-d', strtotime($periodTo));
                    }
                    if ($periodFrom > $periodTo) {
                        $query->andFilterWhere(['like', 'date', $periodFrom]);
                    } else {
                        $query->andFilterWhere(['>=', 'date', $periodFrom]);
                        $query->andFilterWhere(['<=', 'date', $periodTo]);
                    }

                    break;
                case PeriodFilterEnum::ALL:
                    break;
                case PeriodFilterEnum::CURRENT_MONTH:
                default:
                    $query = $this->setDefaultPeriod($query);
                    break;
            }
        } else {
            $query = $this->setDefaultPeriod($query);
        }

        if (isset($params['category'])) {
            $query->leftJoin(Transaction2Category::tableName(),'transaction_id = id');
            $query->andWhere(['transaction2category.category_id' => $params['category']]);
        }
        return $query;
    }

    /**
     * @param Query $query
     * @return Query
     */
    protected function setDefaultPeriod($query)
    {
        $currentMonth = Yii::$app->getFormatter()->asDate('now', "php:Y-m");
        $query->andFilterWhere(['like', 'date', $currentMonth]);

        return $query;
    }
}
