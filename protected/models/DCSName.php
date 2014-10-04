<?php

/**
 * This is the model class for table "DCS_name".
 *
 * The followings are the available columns in table 'DCS_name':
 * @property integer $dcs_id
 * @property string $fulldept
 * @property string $country_id
 * @property string $dcs_name
 *
 * The followings are the available model relations:
 * @property Countries $country
 */
class DCSName extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'DCS_name';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('fulldept, country_id, dcs_name', 'required'),
			array('fulldept', 'length', 'max'=>9),
			array('country_id', 'length', 'max'=>5),
			array('dcs_name', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('dcs_id, fulldept, country_id, dcs_name', 'safe', 'on'=>'search'),
			array('fulldept', 'exist',
					'attributeName'=>'fulldept',
					'className'=>'Departments',
					//'skipOnError',
					'message'=>'Full Department id should exist in the departments table!'),
			array('country_id', 'exist',
					'attributeName'=>'countryid',
					'className'=>'Countries',
					//'skipOnError',
					'message'=>'Country id should exist in the countries table!'),
			
			 array('fulldept, country_id', 'ECompositeUniqueValidator',
			 		'attributesToAddError'=>'fulldept',
			 		'message'=>'This DCS {value_fulldept} already exists for this country id.'),
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
			'country' => array(self::BELONGS_TO, 'Countries', 'country_id'),
			'fulldept' => array(self::BELONGS_TO, 'Departments', 'fulldept'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'dcs_id' => 'DCS id',
			'fulldept' => 'Full Department id',
			'country_id' => 'Country id',
			'dcs_name' => 'DCS Name',
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

		$criteria->compare('dcs_id',$this->dcs_id);
		$criteria->compare('fulldept',$this->fulldept,true);
		$criteria->compare('country_id',$this->country_id,true);
		$criteria->compare('dcs_name',$this->dcs_name,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DCSName the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
