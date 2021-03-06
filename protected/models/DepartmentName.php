<?php

/**
 * This is the model class for table "dept_name".
 *
 * The followings are the available columns in table 'dept_name':
 * @property string $dept_id
 * @property string $countryid
 * @property string $dept_name
 */
class DepartmentName extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dept_name';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('dept_id, dept_name, countryid', 'required'),
			array('dept_id', 'length', 'max'=>3),
			array('countryid', 'length', 'max'=>5),
			array('dept_name', 'length', 'max'=>40),
			array('dept_id, dept_name, countryid', 'safe', 'on'=>'search'),
			array('dept_id, countryid', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'dept_id',
					'message'=>'A record already exists for the following:
				{attr_dept_id} {value_dept_id}
				{attr_countryid} {value_countryid}
			'),
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
			'dept_id' => 'Department id',
			'dept_name' => 'Department Name',
			'countryid' => 'Country',
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

		$criteria->compare('dept_id',$this->dept_id,true);
		$criteria->compare('dept_name',$this->dept_name,true);
		$criteria->compare('countryid',$this->countryid,true);
		
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DepartmentName the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
