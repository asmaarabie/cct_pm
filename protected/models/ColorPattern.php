<?php

/**
 * This is the model class for table "color_pattern".
 *
 * The followings are the available columns in table 'color_pattern':
 * @property string $color_pattern
 * @property string $pattern_desc_e
 * @property string $pattern_desc_a
 *
 * The followings are the available model relations:
 * @property ColorCode[] $colorCodes
 */
class ColorPattern extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'color_pattern';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('color_pattern, pattern_desc_e, pattern_desc_a', 'required'),
			array('color_pattern', 'unique'),
			array('color_pattern', 'length', 'max'=>1),
			array('pattern_desc_e, pattern_desc_a', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('color_pattern, pattern_desc_e, pattern_desc_a', 'safe', 'on'=>'search'),
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
			'colorCodes' => array(self::HAS_MANY, 'ColorCode', 'pattern'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'color_pattern' => 'Pattern Code',
			'pattern_desc_e' => 'English Pattern Description',
			'pattern_desc_a' => 'توصيف النمط العربي',
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

		$criteria->compare('color_pattern',$this->color_pattern,true);
		$criteria->compare('pattern_desc_e',$this->pattern_desc_e,true);
		$criteria->compare('pattern_desc_a',$this->pattern_desc_a,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ColorPattern the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
