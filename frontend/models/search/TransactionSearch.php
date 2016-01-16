<?php

namespace frontend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Transaction;

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
        $query->orderBy([
                            'date' => SORT_DESC,
                            'id' => SORT_DESC
                        ]);

        return $dataProvider;
    }
}
