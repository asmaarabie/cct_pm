<?php

/**
 * This is the model class for table "DCS_size_scale".
 *
 * The followings are the available columns in table 'DCS_size_scale':
 * @property string $DCS_size_id
 * @property string $size_scale
 * @property string $size_fulldept
 * @property string $size_country_id
 *
 * The followings are the available model relations:
 * @property Countries $sizeCountry
 * @property Departments $sizeFulldept
 * @property Size $sizeScale
 */
class DCSSizeScale extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'DCS_size_scale';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('size_scale, size_fulldept', 'required'),
			array('size_scale, size_country_id', 'length', 'max'=>5),
			array('size_fulldept', 'length', 'max'=>9),
			array('size_fulldept', 'exist',
					'attributeName'=>'fulldept',
					'className'=>'Departments',
					//'skipOnError',
					'message'=>'Full Department id should exist in the departments table!'),
			array('size_scale', 'exist',
					'attributeName'=>'scale_number',
					'className'=>'Size',
					//'skipOnError',
					'message'=>'Scale number should exist in the size table!'),
			array('size_country_id', 'exist',
					'attributeName'=>'countryid',
					'className'=>'Countries',
					//'skipOnError',
					'message'=>'Country id should exist in the Country table!'),
			array('size_scale, size_fulldept', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'size_fulldept',
					'message'=>'This department {value_size_fulldept} already has this scale.'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('DCS_size_id, size_scale, size_fulldept, size_country_id', 'safe', 'on'=>'search'),
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
			'sizeCountry' => array(self::BELONGS_TO, 'Countries', 'size_country_id'),
			'sizeFulldept' => array(self::BELONGS_TO, 'Departments', 'size_fulldept'),
			'sizeScale' => array(self::BELONGS_TO, 'Size', 'size_scale'),
			'sizeDeptName' => array(self::BELONGS_TO, 'DCSName', 'size_fulldept'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'DCS_size_id' => 'DCS Size id',
			'size_scale' => 'DCS Scale',
			'size_fulldept' => 'Full Department id',
			'size_country_id' => 'Country id',
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

		$criteria->compare('DCS_size_id',$this->DCS_size_id,true);
		$criteria->compare('size_scale',$this->size_scale,true);
		$criteria->compare('size_fulldept',$this->size_fulldept,true);
		$criteria->compare('size_country_id',$this->size_country_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DCSSizeScale the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
