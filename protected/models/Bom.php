<?php

/**
 * This is the model class for table "bom".
 *
 * The followings are the available columns in table 'bom':
 * @property integer $bom_id
 * @property integer $ss_id
 * @property integer $bs_id
 * @property string $item_desc
 * @property string $item_placement
 * @property string $fulldept
 * @property integer $item_qty
 * @property string $item_consumption
 * @property integer $item_increase
 * @property string $countryid
 * @property integer $itemno
 *
 * The followings are the available model relations:
 * @property Countries $country
 * @property Items $itemno0
 * @property StylesheetBom $ss
 * @property Bom $bs
 * @property BomLog[] $bomLogs
 * @property BomSizeQty[] $bomSizeQties
 */
class Bom extends CActiveRecord
{

	public $itemColor, $itemCode, $itemSize, $itemRequired, $logComment ='', $price, $cost;
	 
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'bom';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ss_id, bs_id, fulldept, item_qty, item_consumption, countryid, itemno', 'required'),
			array('ss_id, item_qty, item_increase, item_consumption, itemno', 'numerical'),
			array('item_desc, item_placement', 'length', 'max'=>40),
			array('fulldept', 'length', 'max'=>9),
			array('item_consumption', 'length', 'max'=>10),
			array('countryid', 'length', 'max'=>5),
			array('itemno', 'exist',
				'attributeName'=>'itemno',
				'className'=>'Items',
				'message'=>'Item number should exist in the Items table'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('bom_id, ss_id, item_desc, item_placement, fulldept, item_qty, item_consumption, item_increase, countryid, itemno', 'safe', 'on'=>'search'),
		);
	} 

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array (
			'ss' => array(self::BELONGS_TO, 'StylesheetBom', 'ss_id'),
			'bs' => array(self::BELONGS_TO, 'Bom', 'bs_id'),
			'country' => array(self::BELONGS_TO, 'Countries', 'countryid'),
			'itemno0' => array(self::BELONGS_TO, 'Items', 'itemno'),
			'bomLogs' => array(self::HAS_MANY, 'BomLog', 'bom_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'bom_id' => 'BOM item id',
			'bs_id' => 'BOMsheet id',
			'ss_id' => 'Stylesheet',
			'item_desc' => 'Item Description - توصى في',
			'item_placement' => 'Item Placement - مكان التركيب',
			'fulldept' => 'Full Department',
			'item_qty' => 'Item Quantity - الكمية بالقطعة',
			'item_consumption' => 'Item Consumption - الاستهلاك',
			'item_increase' => 'Remarks - نسبة الزيادة ٪',
			'countryid' => 'Country id',
			'itemno' => 'Item No',
			'itemColor' => 'Color - اللون',
			'itemCode' => 'Code - الكود',
			'itemSize' => 'Size - المقاس',
			'itemRequired' => 'Required - الاحتياج',
			'price' => 'Price',
			'cost' => 'Cost',
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

		$criteria->compare('bom_id',$this->bom_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('bs_id',$this->bs_id);
		$criteria->compare('item_desc',$this->item_desc,true);
		$criteria->compare('item_placement',$this->item_placement,true);
		$criteria->compare('fulldept',$this->fulldept,true);
		$criteria->compare('item_qty',$this->item_qty);
		$criteria->compare('item_consumption',$this->item_consumption,true);
		$criteria->compare('item_increase',$this->item_increase);
		$criteria->compare('countryid',$this->countryid,true);
		$criteria->compare('itemno',$this->itemno);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Bom the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	protected function afterFind() {
		$item = Items::model()->findByAttributes(array('itemno'=>$this->itemno));
		$this->itemColor = $item->itemattr;
		$this->itemSize = $item->itemsize;
		$this->itemCode = $item->desc1 ; // :TODO: show the arabic desc. " - " . $item->desc2 ; 
		$this->price = $item->unitprice;
		$this->cost = $item->unitcost;
		$this-> itemRequired = floor(((1+ $this->item_increase/100 ) * $this->item_qty) * $this->item_consumption);
		return parent::afterFind(); 
	}
	
	protected function afterSave () {
		// Add a log entry
		$log_entry = new BomLog();
		$log_entry->bs_id = $this->bs_id;
		$log_entry->action_type = ($this->isNewRecord)? "Create":"Update";
		$log_entry->user = Yii::app()->user->id;
		$log_entry->action_comment = ($this->logComment == '')? "{$log_entry->action_type}d bom item id: {$this->bs_id}" : $this->logComment;
		$log_entry->save();
		return parent::afterSave();
	}
	
	protected function afterDelete () {
		// Add a log entry
		$log_entry = new BomLog();
		$log_entry->bs_id = $this->bs_id;
		$log_entry->action_type = "Delete";
		$log_entry->user = Yii::app()->user->id;
		$log_entry->action_comment = ($this->logComment == '')? "{$log_entry->action_type}d bom item id: {$this->bs_id}" : $this->logComment;
		$log_entry->save();
		return parent::afterDelete();
	}
	
}
