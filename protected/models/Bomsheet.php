<?php

/**
 * This is the model class for table "bomsheet".
 *
 * The followings are the available columns in table 'bomsheet':
 * @property integer $bs_id
 * @property integer $ss_id
 * @property string $pono
 * @property integer $user_id
 */
class Bomsheet extends CActiveRecord
{
	public $logComment='';
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'bomsheet';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ss_id, pono, user_id', 'required'),
			array('ss_id, user_id', 'numerical', 'integerOnly'=>true),
			array('pono', 'length', 'max'=>20),
			array('pono', 'exist',
					'attributeName'=>'custid',
					'className'=>'Customers',
					'message'=>'Pono should exist in the Customers table',
			),
			array('ss_id, pono', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'pono',
					'message'=>'A record already exists for the following:
				{attr_pono} {value_pono}
				{attr_ss_id} {value_ss_id}
			'),
			// The following rule is used by search().
			array('bs_id, ss_id, pono, user_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'bs_id' => 'Serial',
			'ss_id' => 'Stylesheet id',
			'pono' => 'Pono',
			'user_id' => 'User id',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('bs_id',$this->bs_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('pono',$this->pono,true);
		$criteria->compare('user_id',$this->user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Bomsheet the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	protected function afterSave () {
		// Add a log entry
		$log_entry = new BomLog();
		$log_entry->bs_id = $this->bs_id;
		$log_entry->action_type = ($this->isNewRecord)? "Create":"Update";
		$log_entry->user = Yii::app()->user->id;
		$log_entry->action_comment = ($this->logComment == '')? "{$log_entry->action_type}d bom sheet serial: {$this->bs_id}" : $this->logComment;
		$log_entry->save();
		return parent::afterSave();
		
	}
	
	protected function beforeDelete () {
		// Add a log entry
		$bomItems = Bom::model()->findAllByAttributes (array('bs_id'=>$this->bs_id));
		foreach ($bomItems as $item)
			$item->delete(); 
		$bomLog = BomLog::model()->findAllByAttributes (array('bs_id'=>$this->bs_id));
		foreach ($bomLog as $item)
			$item->delete();
		
		$sizes = SsSizeQty::model()->findAllByAttributes (array('bs_id'=>$this->bs_id));
		foreach ($sizes as $item)
			$item->delete();
		
		return parent::beforeDelete();
	}
	
	protected function afterDelete() {
		Yii::app()->user->setFlash('success', "BOM sheet is deleted successfully");
		return parent::afterDelete();
	}
}
