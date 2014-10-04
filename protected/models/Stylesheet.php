<?php

/**
 * This is the model class for table "stylesheet".
 *
 * The followings are the available columns in table 'stylesheet':
 * @property integer $ss_id
 * @property string $country_id
 * @property string $dept_id
 * @property string $class_id
 * @property string $subclass_id
 * @property string $season
 * @property string $year
 * @property string $pono
 * @property string $brand_dept_name
 * @property string $category_subc_name
 * @property string $dcs_notes
 * @property string $style_code
 * @property string $stylesheet_note
 * @property string $fabric
 *
 * The followings are the available model relations:
 * @property Bom[] $boms
 * @property Marker[] $markers
 * @property Countries $country
 * @property StylesheetBom $stylesheetBom
 * @property ColorCode[] $colorCodes
 * @property StylesheetImages $stylesheetImages
 * @property StylesheetLog[] $stylesheetLogs
 * @property StylesheetSize[] $stylesheetSizes
 */
class Stylesheet extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'stylesheet';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('country_id, dept_id, class_id, subclass_id, season, year, brand_dept_name, category_subc_name, style_code, fabric', 'required'),
			array('country_id', 'length', 'max'=>5),
			array('dept_id, class_id, subclass_id', 'length', 'max'=>3),
			array('season', 'length', 'max'=>1),
			array('year', 'length', 'max'=>4),
			array('pono', 'length', 'max'=>20),
			array('brand_dept_name, category_subc_name, dcs_notes, style_code, fabric', 'length', 'max'=>40),
			array('stylesheet_note', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_id, country_id, dept_id, class_id, subclass_id, season, year, pono, brand_dept_name, category_subc_name, dcs_notes, style_code, stylesheet_note, fabric', 'safe', 'on'=>'search'),
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
			'boms' => array(self::HAS_MANY, 'Bom', 'ss_id'),
			'markers' => array(self::HAS_MANY, 'Marker', 'ss_id'),
			'country' => array(self::BELONGS_TO, 'Countries', 'country_id'),
			'stylesheetBom' => array(self::HAS_ONE, 'StylesheetBom', 'ss_id'),
			'colorCodes' => array(self::MANY_MANY, 'ColorCode', 'stylesheet_color(ss_id, color_code)'),
			'stylesheetImages' => array(self::HAS_ONE, 'StylesheetImages', 'ss_id'),
			'stylesheetLogs' => array(self::HAS_MANY, 'StylesheetLog', 'stylesheet_id'),
			'stylesheetSizes' => array(self::HAS_MANY, 'StylesheetSize', 'ss_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ss_id' => 'Ss',
			'country_id' => 'Country',
			'dept_id' => 'Dept',
			'class_id' => 'Class',
			'subclass_id' => 'Subclass',
			'season' => 'Season',
			'year' => 'Year',
			'pono' => 'Pono',
			'brand_dept_name' => 'Brand Dept Name',
			'category_subc_name' => 'Category Subc Name',
			'dcs_notes' => 'Dcs Notes',
			'style_code' => 'Style Code',
			'stylesheet_note' => 'Stylesheet Note',
			'fabric' => 'Fabric',
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

		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('country_id',$this->country_id,true);
		$criteria->compare('dept_id',$this->dept_id,true);
		$criteria->compare('class_id',$this->class_id,true);
		$criteria->compare('subclass_id',$this->subclass_id,true);
		$criteria->compare('season',$this->season,true);
		$criteria->compare('year',$this->year,true);
		$criteria->compare('pono',$this->pono,true);
		$criteria->compare('brand_dept_name',$this->brand_dept_name,true);
		$criteria->compare('category_subc_name',$this->category_subc_name,true);
		$criteria->compare('dcs_notes',$this->dcs_notes,true);
		$criteria->compare('style_code',$this->style_code,true);
		$criteria->compare('stylesheet_note',$this->stylesheet_note,true);
		$criteria->compare('fabric',$this->fabric,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Stylesheet the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
