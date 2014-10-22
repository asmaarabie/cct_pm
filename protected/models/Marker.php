<?php

/**
 * This is the model class for table "marker".
 *
 * The followings are the available columns in table 'marker':
 * @property integer $marker_id
 * @property integer $ss_id
 * @property double $width
 * @property double $length
 * @property double $utilization
 * @property double $t_size
 * @property string $ratio
 * @property string $marker_name
 * @property integer $owner
 * 
 * The followings are the available model relations:
 * @property User $owner0
 * @property Stylesheet $ss
 * @property MarkerLog[] $markerLogs
 */
class Marker extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'marker';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('width, length, utilization, t_size, ratio, marker_name, owner', 'required'),
			array('ss_id', 'numerical', 'integerOnly'=>true),
			array('ss_id', 'unique'),
			array('width, length, utilization, t_size, owner', 'numerical'),
			array('ratio, marker_name', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('marker_id, ss_id, width, length, utilization, t_size, ratio, marker_name', 'safe', 'on'=>'search'),
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
				'owner0' => array(self::BELONGS_TO, 'User', 'owner'),
			'ss' => array(self::BELONGS_TO, 'Stylesheet', 'ss_id'),
			'markerLogs' => array(self::HAS_MANY, 'MarkerLog', 'marker_id'),				
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'marker_id' => 'Marker id',
			'ss_id' => 'Stylesheet id',
			'width' => 'Width',
			'length' => 'Length',
			'utilization' => 'Utilization',
			't_size' => 'T Size',
			'ratio' => 'Ratio',
			'marker_name' => 'Marker Name',
			'owner' => "Owner"
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

		$criteria->compare('marker_id',$this->marker_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('width',$this->width);
		$criteria->compare('length',$this->length);
		$criteria->compare('utilization',$this->utilization);
		$criteria->compare('t_size',$this->t_size);
		$criteria->compare('ratio',$this->ratio,true);
		$criteria->compare('marker_name',$this->marker_name,true);
		$criteria->compare('owner',$this->owner,true);
		
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Marker the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	protected function beforeDelete() {
		$logs  = MarkerLog::model()-> findAllByAttributes (array('marker_id'=>$this->marker_id));
		foreach ($logs as $log)
			$log->delete();
		return parent::beforeDelete();
	}
}
