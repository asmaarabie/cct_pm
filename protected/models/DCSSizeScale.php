<?php

/**
 * This is the model class for table "DCS_size_scale".
 *
 * The followings are the available columns in table 'DCS_size_scale':
 * @property string $dept_id
 * @property string $class_id
 * @property string $subclass_id
 * @property string $size_scale
 *
 * The followings are the available model relations:
 * @property Departments $dept
 * @property Departments $class
 * @property Departments $subclass
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
			array('dept_id, class_id, subclass_id, size_scale', 'required'),
			array('dept_id, class_id, subclass_id', 'length', 'max'=>3),
			array('size_scale', 'length', 'max'=>5),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('dept_id, class_id, subclass_id, size_scale', 'safe', 'on'=>'search'),
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
			'dept' => array(self::BELONGS_TO, 'Departments', 'dept_id'),
			'class' => array(self::BELONGS_TO, 'Departments', 'class_id'),
			'subclass' => array(self::BELONGS_TO, 'Departments', 'subclass_id'),
			'sizeScale' => array(self::BELONGS_TO, 'Size', 'size_scale'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'dept_id' => 'Dept',
			'class_id' => 'Class',
			'subclass_id' => 'Subclass',
			'size_scale' => 'Size Scale',
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
		$criteria->compare('class_id',$this->class_id,true);
		$criteria->compare('subclass_id',$this->subclass_id,true);
		$criteria->compare('size_scale',$this->size_scale,true);

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
