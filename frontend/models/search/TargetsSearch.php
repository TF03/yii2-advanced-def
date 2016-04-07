<?php

namespace frontend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Targets;

/**
 * TargetsSearch represents the model behind the search form about `frontend\models\Targets`.
 */
class TargetsSearch extends Targets
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'accounts', 'user_id', 'order', 'status', 'created_at', 'updated_at'], 'integer'],
            [['name'], 'safe'],
            [['value', 'balance', 'date'], 'number'],
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
        $query = Targets::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'value' => $this->value,
            'balance' => $this->balance,
            'accounts' => $this->accounts,
            'user_id' => $this->user_id,
            'date' => $this->date,
            'order' => $this->order,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        $query->orderBy([
            'order' => SORT_ASC,
            'id' => SORT_DESC
        ]);

        return $dataProvider;
    }
}
