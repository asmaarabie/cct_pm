<?php

/**
 * This is the model class for table "departments".
 *
 * The followings are the available columns in table 'departments':
 * @property string $countryid
 * @property string $fulldept
 * @property string $deptid
 * @property string $classid
 * @property string $subclassid
 * @property string $deptname
 * @property string $classname
 * @property string $subclassname
 *
 * The followings are the available model relations:
 * @property DCSName[] $dCSNames
 * @property DCSSizeScale[] $dCSSizeScales
 * @property DCSSizeScale[] $dCSSizeScales1
 * @property DCSSizeScale[] $dCSSizeScales2
 * @property StylesheetBom[] $stylesheetBoms
 * @property StylesheetBom[] $stylesheetBoms1
 * @property StylesheetBom[] $stylesheetBoms2
 */
class Departments extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'departments';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('countryid, fulldept, deptid', 'required'),
			array('countryid', 'length', 'max'=>5),
			array('fulldept', 'length', 'max'=>9),
			array('deptid, classid, subclassid', 'length', 'max'=>3),
			array('deptname, classname, subclassname', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('countryid, fulldept, deptid, classid, subclassid, deptname, classname, subclassname', 'safe', 'on'=>'search'),
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
			'dCSNames' => array(self::HAS_MANY, 'DCSName', 'fulldept'),
			'dCSSizeScales' => array(self::HAS_MANY, 'DCSSizeScale', 'dept_id'),
			'dCSSizeScales1' => array(self::HAS_MANY, 'DCSSizeScale', 'class_id'),
			'dCSSizeScales2' => array(self::HAS_MANY, 'DCSSizeScale', 'subclass_id'),
			'stylesheetBoms' => array(self::HAS_MANY, 'StylesheetBom', 'dept_id'),
			'stylesheetBoms1' => array(self::HAS_MANY, 'StylesheetBom', 'class_id'),
			'stylesheetBoms2' => array(self::HAS_MANY, 'StylesheetBom', 'subclass_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'countryid' => 'Countryid',
			'fulldept' => 'Fulldept',
			'deptid' => 'Deptid',
			'classid' => 'Classid',
			'subclassid' => 'Subclassid',
			'deptname' => 'Deptname',
			'classname' => 'Classname',
			'subclassname' => 'Subclassname',
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
		$criteria->compare('fulldept',$this->fulldept,true);
		$criteria->compare('deptid',$this->deptid,true);
		$criteria->compare('classid',$this->classid,true);
		$criteria->compare('subclassid',$this->subclassid,true);
		$criteria->compare('deptname',$this->deptname,true);
		$criteria->compare('classname',$this->classname,true);
		$criteria->compare('subclassname',$this->subclassname,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Departments the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
