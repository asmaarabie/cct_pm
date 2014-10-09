<?php

/**
 * This is the model class for table "color_shadow".
 *
 * The followings are the available columns in table 'color_shadow':
 * @property string $color_shadow
 * @property string $shadow_desc_a
 * @property string $shadow_desc_e
 *
 * The followings are the available model relations:
 * @property ColorCode[] $colorCodes
 */
class ColorShadow extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'color_shadow';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('color_shadow, shadow_desc_a, shadow_desc_e', 'required'),
			array('color_shadow', 'unique'),
			array('color_shadow', 'length', 'max'=>1),
			array('shadow_desc_a, shadow_desc_e', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('color_shadow, shadow_desc_a, shadow_desc_e', 'safe', 'on'=>'search'),
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
			'colorCodes' => array(self::HAS_MANY, 'ColorCode', 'shadow'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'color_shadow' => 'Color Shadow Code',
			'shadow_desc_a' => 'توصيف اللون الثاني',
			'shadow_desc_e' => 'English Shadow Description',
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

		$criteria->compare('color_shadow',$this->color_shadow,true);
		$criteria->compare('shadow_desc_a',$this->shadow_desc_a,true);
		$criteria->compare('shadow_desc_e',$this->shadow_desc_e,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ColorShadow the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
