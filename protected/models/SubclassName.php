<?php

/**
 * This is the model class for table "subclass_name".
 *
 * The followings are the available columns in table 'subclass_name':
 * @property string $subclassid
 * @property string $subclass_name
 * @property string $countryid
 */
class SubclassName extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'subclass_name';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('subclassid, subclass_name', 'required'),
			array('subclassid', 'length', 'max'=>3),
			array('countryid', 'length', 'max'=>5),
			array('subclass_name', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('subclassid, subclass_name, countryid', 'safe', 'on'=>'search'),
			array('subclassid, countryid', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'subclassid',
					'message'=>'A record already exists for the following:
				{attr_subclassid} {value_subclassid}
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
			'subclassid' => 'Subclass id',
			'subclass_name' => 'Subclass Name',
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

		$criteria->compare('subclassid',$this->subclassid,true);
		$criteria->compare('subclass_name',$this->subclass_name,true);
		$criteria->compare('countryid',$this->countryid,true);
		
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return SubclassName the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
