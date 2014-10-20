<?php

/**
 * This is the model class for table "stylesheet_color".
 *
 * The followings are the available columns in table 'stylesheet_color':
 * @property integer $ss_color_id
 * @property integer $ss_id
 * @property string $color_code
 * @property integer $print
 * @property integer $emb
 * @property string $place
 * @property string $code
 * @property string $ss_color_desc
 *
 * The followings are the available model relations:
 * @property ColorCode $colorCode
 * @property Stylesheet $ss
 */
class StylesheetColor extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'stylesheet_color';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ss_id, color_code', 'required'),
			array('ss_id, print, emb', 'numerical', 'integerOnly'=>true),
			array('color_code', 'length', 'max'=>8),
			array('place, ss_color_desc', 'length', 'max'=>40),
			array('code', 'length', 'max'=>10),
			array('ss_id, color_code', 'ECompositeUniqueValidator',
				'attributesToAddError'=>'color_code',
				'message'=>'A record already exists for the following
				{attr_color_code} {value_color_code} and {attr_ss_id} {value_ss_id}, check the increment to add a new record',
				'on'=>'insert'
			),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_color_id, ss_id, color_code, print, emb, place, code, ss_color_desc', 'safe', 'on'=>'search'),
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
			'colorCode' => array(self::BELONGS_TO, 'ColorCode', 'color_code'),
			'ss' => array(self::BELONGS_TO, 'Stylesheet', 'ss_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ss_color_id' => 'Stylesheet Color id',
			'ss_id' => 'Stylesheet id',
			'color_code' => 'Color Code',
			'print' => 'Print',
			'emb' => 'Embroidery',
			'place' => 'Place',
			'code' => 'Code',
			'ss_color_desc' => 'Description',
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

		$criteria->compare('ss_color_id',$this->ss_color_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('color_code',$this->color_code,true);
		$criteria->compare('print',$this->print);
		$criteria->compare('emb',$this->emb);
		$criteria->compare('place',$this->place,true);
		$criteria->compare('code',$this->code,true);
		$criteria->compare('ss_color_desc',$this->ss_color_desc,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StylesheetColor the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
