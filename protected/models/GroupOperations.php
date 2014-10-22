<?php

/**
 * This is the model class for table "group_operations".
 *
 * The followings are the available columns in table 'group_operations':
 * @property integer $grp_op_id
 * @property integer $group_id
 * @property string $op_name
 * @property integer $checked
 *
 * The followings are the available model relations:
 * @property Operation $opName
 * @property Group $group
 */
class GroupOperations extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'group_operations';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('group_id, op_name, checked', 'required'),
			array('group_id, checked', 'numerical', 'integerOnly'=>true),
			array('op_name', 'length', 'max'=>40),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('grp_op_id, group_id, op_name, checked', 'safe', 'on'=>'search'),
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
			'opName' => array(self::BELONGS_TO, 'Operation', 'op_name'),
			'group' => array(self::BELONGS_TO, 'Group', 'group_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'grp_op_id' => 'Grp Op',
			'group_id' => 'Group',
			'op_name' => 'Op Name',
			'checked' => 'Checked',
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

		$criteria->compare('grp_op_id',$this->grp_op_id);
		$criteria->compare('group_id',$this->group_id);
		$criteria->compare('op_name',$this->op_name,true);
		$criteria->compare('checked',$this->checked);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return GroupOperations the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
