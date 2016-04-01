<?php

namespace frontend\models\search;

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
     * @return mixed
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

        if (isset($params['category'])) {
            $query->leftJoin(Transaction2Category::tableName(),'transaction_id = id');
            $query->andWhere(['transaction2category.category_id' => $params['category']]);
        }
        return $query;
    }
}
