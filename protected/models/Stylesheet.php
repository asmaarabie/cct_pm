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
 * @property string $dcs_notes
 * @property string $style_code
 * @property string $stylesheet_note
 * @property string $fabric
 * @property string $scale
 * @property string $sizes
 * The followings are the available model relations:
 * @property Bom[] $boms
 * @property Marker[] $markers
 * @property Size $scale0
 * @property Countries $country
 * @property StylesheetBom[] $stylesheetBoms
 * @property StylesheetColor[] $stylesheetColors
 * @property StylesheetImages[] $stylesheetImages
 * @property StylesheetLog[] $stylesheetLogs
 * @property StylesheetSize[] $stylesheetSizes
 */
class Stylesheet extends CActiveRecord
{
	public $brand, $category, $dcs, $desc1, $countryName, $formatSeasons ;
	
	public $seasons = array ("S"=> "Summer", "A"=> "Autumn", "W"=> "Winter", "G" => "General");
	
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
			array('country_id, dept_id, class_id, subclass_id, season, year, style_code, fabric, scale', 'required'),
			array('country_id, scale', 'length', 'max'=>5),
			array('dept_id, class_id, subclass_id', 'length', 'max'=>3),
			array('season', 'length', 'max'=>1),
			array('year', 'length', 'max'=>4),
			array('pono', 'length', 'max'=>20),
			array('dcs_notes, style_code, fabric, sizes', 'length', 'max'=>40),
			array('stylesheet_note', 'safe'),
			array('country_id', 'exist',
				'attributeName'=>'countryid',
				'className'=>'Countries',
				'message'=>'Country id should exist in the countries table!'),
			array('dept_id', 'exist',
				'attributeName'=>'deptid',
				'className'=>'Departments',
				'message'=>'Department id should exist in the Department table!'),
			array('class_id', 'exist',
				'attributeName'=>'classid',
				'className'=>'Departments',
				'message'=>'Class id should exist in the Department table!'),
			array('subclass_id', 'exist',
				'attributeName'=>'subclassid',
				'className'=>'Departments',
				'message'=>'Subclass id should exist in the Department table!'),
				
			array('country_id, dept_id, class_id, subclass_id, style_code, season, year', 'ECompositeUniqueValidator',
				'attributesToAddError'=>'country_id',
				'message'=>'A record already exists for the following:
				 {attr_country_id} {value_country_id}
				{attr_dept_id} {value_dept_id}
				{attr_class_id} {value_class_id}
				{attr_subclass_id} {value_subclass_id}
				{attr_year} {value_year}
				{attr_season} {value_season}
						'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_id, country_id, dept_id, class_id, subclass_id, season, year, pono, dcs_notes, style_code, stylesheet_note, fabric, scale', 'safe', 'on'=>'search'),
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
			'scale0' => array(self::BELONGS_TO, 'Size', 'scale'),
			'country' => array(self::BELONGS_TO, 'Countries', 'country_id'),
			'stylesheetBoms' => array(self::HAS_MANY, 'StylesheetBom', 'ss_id'),
			'stylesheetColors' => array(self::HAS_MANY, 'StylesheetColor', 'ss_id'),
			'stylesheetImages' => array(self::HAS_MANY, 'StylesheetImages', 'ss_id'),
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
			'ss_id' => 'Stylesheet id',
			'country_id' => 'Country id',
			'dept_id' => 'Department id',
			'class_id' => 'Class id',
			'subclass_id' => 'Subclass id',
			'season' => 'Season',
			'year' => 'Year',
			'pono' => 'Pono',
			'dcs_notes' => 'DCS Notes',
			'style_code' => 'Style Code',
			'stylesheet_note' => 'Stylesheet Notes',
			'fabric' => 'Fabric',
			'scale' => 'Scale',
			'sizes' => 'sizes',
			'desc1' => "DESC1",
			'dcs' => 'DCS',
			'brand' => 'Brand',
			'category' => 'Category'
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
		$criteria->compare('dcs_notes',$this->dcs_notes,true);
		$criteria->compare('style_code',$this->style_code,true);
		$criteria->compare('stylesheet_note',$this->stylesheet_note,true);
		$criteria->compare('fabric',$this->fabric,true);
		$criteria->compare('scale',$this->scale,true);
		$criteria->compare('sizes',$this->sizes,true);
		
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
	
	public function getYearOptions() {
		$year["0000"] = "0000";
		$years = range (1900, 2100);
		foreach ($years as $y)
			$year[$y] = $y;
		return $year;
	}
	
	public function getSeasonOptions() {
		return array ("S"=> "Summer", "A"=> "Autumn", "W"=> "Winter", "G" => "General");
	}
	
}