<?php

/**
 * This is the model class for table "iso_header".
 *
 * The followings are the available columns in table 'iso_header':
 * @property integer $header_id
 * @property string $header_code
 * @property integer $version
 * @property string $date
 * @property int $def
 */
class IsoHeader extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'iso_header';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('header_code, version, date, def', 'required'),
			array('version', 'numerical', 'integerOnly'=>true),
			array('header_code', 'length', 'max'=>15),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('header_id, header_code, version, date', 'safe', 'on'=>'search'),
			array('header_code, version, def', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'version',
					'message'=>'This version {value_version} already exists for this header code.'),
		
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
			'header_id' => 'Header',
			'header_code' => 'Header Code',
			'version' => 'Version',
			'date' => 'Date',
			'def' => 'Default'
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

		$criteria->compare('header_id',$this->header_id);
		$criteria->compare('header_code',$this->header_code,true);
		$criteria->compare('version',$this->version);
		$criteria->compare('date',$this->date,true);
		$criteria->compare('def',$this->def,true);
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return IsoHeader the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
