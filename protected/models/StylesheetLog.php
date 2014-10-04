<?php

/**
 * This is the model class for table "stylesheet_log".
 *
 * The followings are the available columns in table 'stylesheet_log':
 * @property integer $stylesheet_id
 * @property string $action_time_stamp
 * @property string $action_type
 * @property string $action_comment
 *
 * The followings are the available model relations:
 * @property Stylesheet $stylesheet
 */
class StylesheetLog extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'stylesheet_log';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('stylesheet_id, action_time_stamp, action_type, action_comment', 'required'),
			array('stylesheet_id', 'numerical', 'integerOnly'=>true),
			array('action_type', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('stylesheet_id, action_time_stamp, action_type, action_comment', 'safe', 'on'=>'search'),
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
			'stylesheet' => array(self::BELONGS_TO, 'Stylesheet', 'stylesheet_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'stylesheet_id' => 'Stylesheet',
			'action_time_stamp' => 'Action Time Stamp',
			'action_type' => 'Action Type',
			'action_comment' => 'Action Comment',
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

		$criteria->compare('stylesheet_id',$this->stylesheet_id);
		$criteria->compare('action_time_stamp',$this->action_time_stamp,true);
		$criteria->compare('action_type',$this->action_type,true);
		$criteria->compare('action_comment',$this->action_comment,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StylesheetLog the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
