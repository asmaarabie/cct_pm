<?php

/**
 * This is the model class for table "stylesheet".
 *
 * The followings are the available columns in table 'stylesheet':
 * @property integer $ss_id
 * @property string $fulldept
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
 * @property integer $user_id
 *  
 * The followings are the available model relations:
 * @property Bom[] $boms
 * @property Marker[] $markers
 * @property User $user
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
	public $brand, $category, $dcs, $desc1, $countryName, $formatSeasons, $owner, $fulldept ;
	
	public $seasons = array ("S"=> "Summer", "W"=> "Winter", "G" => "General");
	
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
			array('fulldept, season, year, style_code, fabric, scale', 'required'),
			array('user_id', 'numerical', 'integerOnly'=>true),
			array('season', 'length', 'max'=>1),
			array('year', 'length', 'max'=>4),
			array('pono', 'length', 'max'=>20),
			array('dcs_notes, style_code, fabric, sizes', 'length', 'max'=>40),
			array('stylesheet_note', 'safe'),
			array('fulldept, style_code, season, year', 'ECompositeUniqueValidator',
					'attributesToAddError'=>'fulldept',
					'message'=>'A record already exists for the following:
					{attr_fulldept} {value_fulldept}
					{attr_year} {value_year}
					{attr_season} {value_season}
			'),
			
			/*
			 * 
			array('country_id, scale', 'length', 'max'=>5),
			array('dept_id, class_id, subclass_id', 'length', 'max'=>3),
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
			*/
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_id, fulldept, country_id, dept_id, class_id, subclass_id, season, year, pono, dcs_notes, style_code, stylesheet_note, fabric, scale', 'safe', 'on'=>'search'),
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
			'user' => array(self::BELONGS_TO, 'User', 'user_id'),
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
			'fulldept' => 'Full Department id',
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
			'dcs' => 'DCS Name',
			'brand' => 'Brand',
			'category' => 'Category',
			'user_id' => 'User id',
			'owner' => 'Stylesheet Owner'
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
		$criteria->compare('fulldept',$this->fulldept,true);
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
		$criteria->compare('user_id',$this->user_id,true);
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
		return array ("S"=> "Summer", "W"=> "Winter", "G" => "General");
	}
	
	protected function beforeDelete() {
		$bomsheet = Bomsheet::model()-> findAllByAttributes (array('ss_id'=>$this->ss_id));
		if (count($bomsheet)!=0) {
			Yii::app()->user->setFlash('error', "BOM sheet is attached to this stylesheet and it cannot be deleted");
			return false;
		}
		
		$markersheets = Marker::model()-> findAllByAttributes (array('ss_id'=>$this->ss_id));
		if (count($markersheets)!=0) {
			Yii::app()->user->setFlash('error', "There are markers attached to this stylesheet and it cannot be deleted");
			return false;
		}
		
		$delete = array ();
		$delete["ss_boms"] = StylesheetBom::model()-> findAllByAttributes (array('ss_id'=>$this->ss_id));
		$delete["colors"] = StylesheetColor::model()->findAllByAttributes (array('ss_id'=>$this->ss_id));
		$delete["images"] = StylesheetImages::model()->findAllByAttributes (array('ss_id'=>$this->ss_id));
		$delete["logs"] = StylesheetLog::model()->findAllByAttributes (array('ss_id'=>$this->ss_id));
		
		foreach ($delete as $table) 
			foreach ($table as $record)
				$record->delete();
		
		return parent::beforeDelete();
		
	}
	
	protected function afterDelete() {
		Yii::app()->user->setFlash('success', "Stylesheet is deleted successfully");
		return parent::afterDelete();
	}
	
	protected function afterFind () {
		// Get brand name: brand name is the deptid name from the dept_name table
		$dept_tbl = DepartmentName::model()->tableName();
		$sql = "SELECT dept_name FROM {$dept_tbl} where dept_id='{$this->dept_id}' and countryid='{$this->country_id}'";
		$department["brand"] =  Yii::app()->db->createCommand($sql)->queryRow()["dept_name"];
		$department["brand"] = ($department["brand"] == "")? "No name for the following department {$this->dept_id}" : $department["brand"];
		
		// Get category name: category name is the subclassid name from the subclass_name table
		$subclass_tbl = SubclassName::model()->tableName();
		$sql = "SELECT subclass_name FROM {$subclass_tbl} where subclassid='{$this->subclass_id}' and countryid='{$this->country_id}'";
		$department["category"] =  Yii::app()->db->createCommand($sql)->queryRow()["subclass_name"];
		$department["category"] = ($department["category"] == "")? "No name for the following subclass {$this->subclass_id}" : $department["category"];
		
		// Get department, class, subclass names
		$dept = Departments::model()->findByAttributes(array('countryid'=>$this->country_id, 'fulldept'=>$this->fulldept));
		$department["deptname"] =  $dept->deptname;
		$department["subclassname"] =  $dept->classname;
		$department["classname"] =  $dept->subclassname;
		
		$this->brand = $department["brand"];
		$this->category = $department["category"];
		$this->dcs = $department["deptname"]. " " . $department["classname"]. " " . $department["subclassname"];
		
		$this->formatSeasons = $this->season . substr($this->year, 2, 2);
		$this->desc1 = $this->dept_id . " " . $this->class_id . " " . $this->subclass_id . " - ". $this->formatSeasons;
		$this->countryName = $this->country_id . " - " . $this->country->countrydesc;
		$this->owner = $this->user->user_name;
		return parent::afterFind();
	}
	
	// Each stylesheet has a scale of sizes, each size has a quantity. SsSizeQty is the model that holds this information
	// BOM sheet ($bs_id) initialization starts with inserting all the selected sizes for this stylesheet into the database
	// Each stylesheet size will be saved in a separate  SsSizeQty model with quantiry initialized to 0
	// returns true on successfull init
	public function initStylesheetSizeQuantities ($bs_id) {
		$sizes = Size::model()->getScaleSizes($this->scale);
		$model_sizes = $this->sizes;
		
		$allSaved = true;
		foreach ($sizes as $i=>$size) {
			if (substr($model_sizes,$i,1)=="1") {
				$s_model = new SsSizeQty();
				$s_model->bs_id = $bs_id;
				$s_model->size = $size;
				$s_model->size_qty = 0;
				if (!$s_model->save())
					$allSaved = false;
			}
		}
		return $allSaved;
	}
}