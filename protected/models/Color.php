<?php

/**
 * This is the model class for table "color".
 *
 * The followings are the available columns in table 'color':
 * @property string $color_id
 * @property string $color_desc_a
 * @property string $color_img
 * @property string $color_desc_e
 *
 * The followings are the available model relations:
 * @property ColorCode[] $colorCodes
 */
class Color extends CActiveRecord
{
	public $oldImg;
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'color';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('color_id, color_desc_a, color_desc_e', 'required'),
			array('color_id', 'unique'),
			array('color_id', 'length', 'max'=>2),
			array('color_desc_a', 'length', 'max'=>20, 'encoding'=>"utf-8"),
			array('color_img, color_desc_e', 'length', 'max'=>40),
			array('color_img', 'file', 'on'=>'insert',
					'types'=>'jpg, gif, png',  
					'maxSize'=>1024 * 1024 * 0.5, 
					'tooLarge'=>'File has to be smaller than 512 B',
					'allowEmpty'=>false),
			array('color_img', 'file', 'on'=>'update',
					'types'=>'jpg, gif, png', 
					'tooLarge'=>'File has to be smaller than 512 B',
					'allowEmpty'=>true),
			
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('color_id, color_desc_a, color_img, color_desc_e', 'safe', 'on'=>'search'),
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
			'colorCodes' => array(self::HAS_MANY, 'ColorCode', 'color'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'color_id' => 'Color Code',
			'color_desc_a' => 'اسم اللون العربي',
			'color_img' => 'Color Image',
			'color_desc_e' => 'English Color Name',
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

		$criteria->compare('color_id',$this->color_id,true);
		$criteria->compare('color_desc_a',$this->color_desc_a,true);
		$criteria->compare('color_img',$this->color_img,true);
		$criteria->compare('color_desc_e',$this->color_desc_e,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	public function afterFind() {
		parent::afterFind();
		$this->oldImg = $this->color_img;
	}
	
	/*public function beforeSave() {
		$uploadPath = Yii::app()->params['colorUploadPath'];
		
		$uploadedFile=CUploadedFile::getInstance($this,'color_img');
		
		$uploadedFile->saveAs($uploadPath.$model->color_img);
		
		if(!empty($this->oldImg)) {
			$delete = Yii::app()->params['colorUploadPath'].$this->oldImg;
			if(file_exists($delete)) unlink($delete);
		}
		
		if(empty($this->color_img) && !empty($this->oldImg)) $this->color_img = $this->oldImg;
		return parent::beforeSave();
		
	}
	*/
	public function afterDelete() {
		$this->deleteImagem();
		return parent::afterDelete();
	}
	
	public function deleteImagem() {
		$imagem = $this->color_img;
		return unlink(Yii::app()->params['colorUploadPath'].$imagem);
	}
	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Color the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
