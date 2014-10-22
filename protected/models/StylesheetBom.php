<?php

/**
 * This is the model class for table "stylesheet_bom".
 *
 * The followings are the available columns in table 'stylesheet_bom':
 * @property integer $ss_bom_id
 * @property integer $ss_id
 * @property string $dcs_name
 * @property string $dept_id
 * @property string $class_id
 * @property string $subclass_id
 * @property string $item_color_id
 * @property string $item_desc
 * @property string $item_cons
 * @property string $item_placement
 * @property string $countryid
 *
 * The followings are the available model relations:
 * @property Stylesheet $ss
 * @property ColorCode $itemColor
 * @property Countries $country
 * @property Departments $dept
 * @property Departments $class
 * @property Departments $subclass
 */
class StylesheetBom extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'stylesheet_bom';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ss_id, dcs_name, dept_id, class_id, subclass_id, item_color_id, countryid', 'required'),
			array('ss_id', 'numerical', 'integerOnly'=>true),
			array('dcs_name, item_color_id, item_desc, item_placement', 'length', 'max'=>40),
			array('dept_id, class_id, subclass_id', 'length', 'max'=>3),
			array('item_cons', 'length', 'max'=>20),
			array('countryid', 'length', 'max'=>5),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_bom_id, ss_id, dcs_name, dept_id, class_id, subclass_id, item_color_id, item_desc, item_cons, item_placement, countryid', 'safe', 'on'=>'search'),
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
			'ss' => array(self::BELONGS_TO, 'Stylesheet', 'ss_id'),
			'itemColor' => array(self::BELONGS_TO, 'ColorCode', 'item_color_id'),
			'country' => array(self::BELONGS_TO, 'Countries', 'countryid'),
			'dept' => array(self::BELONGS_TO, 'Departments', 'dept_id'),
			'class' => array(self::BELONGS_TO, 'Departments', 'class_id'),
			'subclass' => array(self::BELONGS_TO, 'Departments', 'subclass_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ss_bom_id' => 'Ss Bom',
			'ss_id' => 'Ss',
			'dcs_name' => 'Dcs Name',
			'dept_id' => 'Dept',
			'class_id' => 'Class',
			'subclass_id' => 'Subclass',
			'item_color_id' => 'Item Color',
			'item_desc' => 'Item Desc',
			'item_cons' => 'Item Cons',
			'item_placement' => 'Item Placement',
			'countryid' => 'Countryid',
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

		$criteria->compare('ss_bom_id',$this->ss_bom_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('dcs_name',$this->dcs_name,true);
		$criteria->compare('dept_id',$this->dept_id,true);
		$criteria->compare('class_id',$this->class_id,true);
		$criteria->compare('subclass_id',$this->subclass_id,true);
		$criteria->compare('item_color_id',$this->item_color_id,true);
		$criteria->compare('item_desc',$this->item_desc,true);
		$criteria->compare('item_cons',$this->item_cons,true);
		$criteria->compare('item_placement',$this->item_placement,true);
		$criteria->compare('countryid',$this->countryid,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StylesheetBom the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}