<?php

/**
 * This is the model class for table "ss_size_qty".
 *
 * The followings are the available columns in table 'ss_size_qty':
 * @property integer $ss_size_qty_id
 * @property integer $bs_id
 * @property string $size
 * @property integer $size_qty
 *
 * The followings are the available model relations:
 * @property Stylesheet $ss
 */
class SsSizeQty extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ss_size_qty';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('bs_id, size, size_qty', 'required'),
			array('bs_id, size_qty', 'numerical', 'integerOnly'=>true),
			array('size', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_size_qty_id, bs_id, size, size_qty', 'safe', 'on'=>'search'),
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
			'bs' => array(self::BELONGS_TO, 'Bomsheet', 'bs_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ss_size_qty_id' => 'Ss Size Qty',
			'bs_id' => 'Bomstylesheet id',
			'size' => 'Size',
			'size_qty' => 'Size Qty',
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

		$criteria->compare('ss_size_qty_id',$this->ss_size_qty_id);
		$criteria->compare('bs_id',$this->bs_id);
		$criteria->compare('size',$this->size,true);
		$criteria->compare('size_qty',$this->size_qty);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return SsSizeQty the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
