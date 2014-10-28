<?php

/**
 * This is the model class for table "color_code".
 *
 * The followings are the available columns in table 'color_code':
 * @property string $color
 * @property string $shadow
 * @property string $pattern
 * @property string $length
 * @property string $shape
 * @property string $color_serial
 * @property string $color_code
 *
 * The followings are the available model relations:
 * @property Color $color0
 * @property ColorLength $length0
 * @property ColorPattern $pattern0
 * @property ColorShadow $shadow0
 * @property ColorShape $shape0
 * @property StylesheetBom[] $stylesheetBoms
 * @property Stylesheet[] $stylesheets
 */
class ColorCode extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'color_code';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('color, shadow, pattern, length, shape, color_code, color_serial', 'required'),
			array('color_code', 'unique'),
			array('color, color_serial', 'length', 'max'=>2),
			array('shadow, pattern, length, shape', 'length', 'max'=>1),
			array('color_code', 'length', 'max'=>8),
			array('color', 'exist',
					'attributeName'=>'color_id',
					'className'=>'Color',
					//'skipOnError',
					'message'=>'Color id should exist in the Color table!'),
			array('shadow', 'exist',
					'attributeName'=>'color_shadow',
					'className'=>'ColorShadow',
					//'skipOnError',
					'message'=>'Color Shadow id should exist in the Color Shadow table!'),
			array('pattern', 'exist',
					'attributeName'=>'color_pattern',
					'className'=>'ColorPattern',
					//'skipOnError',
					'message'=>'Color Pattern id should exist in the Color Pattern table!'),
			array('length', 'exist',
					'attributeName'=>'color_length',
					'className'=>'ColorLength',
					//'skipOnError',
					'message'=>'Color Length id should exist in the Color Length table!'),
			array('shape', 'exist',
					'attributeName'=>'color_shape',
					'className'=>'ColorShape',
					//'skipOnError',
					'message'=>'Pattern Shape id should exist in the Color Shape table!'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('color, shadow, pattern, length, shape, color_serial, color_code', 'safe', 'on'=>'search'),
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
			'color0' => array(self::BELONGS_TO, 'Color', 'color'),
			'length0' => array(self::BELONGS_TO, 'ColorLength', 'length'),
			'pattern0' => array(self::BELONGS_TO, 'ColorPattern', 'pattern'),
			'shadow0' => array(self::BELONGS_TO, 'ColorShadow', 'shadow'),
			'shape0' => array(self::BELONGS_TO, 'ColorShape', 'shape'),
			'stylesheetBoms' => array(self::HAS_MANY, 'StylesheetBom', 'item_color_id'),
			'stylesheets' => array(self::MANY_MANY, 'Stylesheet', 'stylesheet_color(color_code, ss_id)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'color' => 'Color id',
			'shadow' => 'Shadow',
			'pattern' => 'Pattern',
			'length' => 'Length',
			'shape' => 'Pattern Shape',
			'color_serial' => 'Color Serial',
			'color_code' => 'Color Code',
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

		$criteria->compare('color',$this->color,true);
		$criteria->compare('shadow',$this->shadow,true);
		$criteria->compare('pattern',$this->pattern,true);
		$criteria->compare('length',$this->length,true);
		$criteria->compare('shape',$this->shape,true);
		$criteria->compare('color_serial',$this->color_serial,true);
		$criteria->compare('color_code',$this->color_code,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ColorCode the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	protected function beforeDelete() {
		if (count($this->stylesheetBoms)!=0) {
			Yii::app()->user->setFlash('error', "There are stylesheet bom items attached to this color code and cannot be deleted");
			return false;
		}
		if (count($this->stylesheets)!=0) {
			Yii::app()->user->setFlash('error', "There are stylesheets attached to this color code and cannot be deleted");
			return false;
		}
		
		return parent::beforeDelete();
	}
	
	protected function afterDelete () {
		Yii::app()->user->setFlash('success', "Color code is deleted successfully");
		return parent::afterDelete();
	}
}
