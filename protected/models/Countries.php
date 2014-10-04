<?php

/**
 * This is the model class for table "countries".
 *
 * The followings are the available columns in table 'countries':
 * @property string $countryid
 * @property string $countrydesc
 * @property string $filepath
 * @property string $rpro9sbsid
 * @property string $exchangerate
 *
 * The followings are the available model relations:
 * @property Departments[] $departments
 * @property Bom[] $boms
 * @property Stylesheet[] $stylesheets
 * @property StylesheetBom[] $stylesheetBoms
 */
class Countries extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'countries';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('countryid, countrydesc, rpro9sbsid, exchangerate', 'required'),
			array('countryid, rpro9sbsid', 'length', 'max'=>5),
			array('countrydesc', 'length', 'max'=>40),
			array('filepath', 'length', 'max'=>255),
			array('exchangerate', 'length', 'max'=>12),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('countryid, countrydesc, filepath, rpro9sbsid, exchangerate', 'safe', 'on'=>'search'),
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
			'departments' => array(self::MANY_MANY, 'Departments', 'DCS_name(country_id, fulldept)'),
			'boms' => array(self::HAS_MANY, 'Bom', 'countryid'),
			'stylesheets' => array(self::HAS_MANY, 'Stylesheet', 'country_id'),
			'stylesheetBoms' => array(self::HAS_MANY, 'StylesheetBom', 'countryid'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'countryid' => 'Countryid',
			'countrydesc' => 'Countrydesc',
			'filepath' => 'Filepath',
			'rpro9sbsid' => 'Rpro9sbsid',
			'exchangerate' => 'Exchangerate',
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

		$criteria->compare('countryid',$this->countryid,true);
		$criteria->compare('countrydesc',$this->countrydesc,true);
		$criteria->compare('filepath',$this->filepath,true);
		$criteria->compare('rpro9sbsid',$this->rpro9sbsid,true);
		$criteria->compare('exchangerate',$this->exchangerate,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Countries the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
