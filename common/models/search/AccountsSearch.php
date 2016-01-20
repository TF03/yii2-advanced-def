<?php

namespace common\models\search;

use frontend\models\Accounts;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * AccountsSearch represents the model behind the search form about `common\models\Accounts`.
 */
class AccountsSearch extends Accounts
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'sort', 'status'], 'integer'],
            [['name', 'valuta', 'color'], 'safe'],
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
        $query = Accounts::find();

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
            'user_id' => $this->user_id,
            'sort' => $this->sort,
            'amount' => $this->amount,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'valuta', $this->valuta])
            ->andFilterWhere(['like', 'color', $this->color]);

        return $dataProvider;
    }
}
