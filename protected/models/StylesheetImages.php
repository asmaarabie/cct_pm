<?php

/**
 * This is the model class for table "stylesheet_images".
 *
 * The followings are the available columns in table 'stylesheet_images':
 * @property integer $ss_img_id
 * @property integer $ss_id
 * @property string $img_path
 *
 * The followings are the available model relations:
 * @property Stylesheet $ss
 */
class StylesheetImages extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'stylesheet_images';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ss_id', 'required'),
			array('ss_id', 'numerical', 'integerOnly'=>true),
			array('img_path', 'file', 'on'=>'insert',
					'types'=>'jpg, gif, png',
					'maxSize'=>1024 * 1024,
					'tooLarge'=>'Image has to be smaller than 1 MB',
					'allowEmpty'=>false),
			array('img_path', 'file', 'on'=>'update',
					'types'=>'jpg, gif, png',
					'maxSize'=>1024 * 1024,
					'tooLarge'=>'Image has to be smaller than 1 MB',
					'allowEmpty'=>true),
			array('img_path', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ss_img_id, ss_id, img_path', 'safe', 'on'=>'search'),
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
			'ss' => array(self::BELONGS_TO, 'Stylesheet', 'ss_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ss_img_id' => 'Image id',
			'ss_id' => 'Stylesheet id',
			'img_path' => 'Image path',
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

		$criteria->compare('ss_img_id',$this->ss_img_id);
		$criteria->compare('ss_id',$this->ss_id);
		$criteria->compare('img_path',$this->img_path,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	// delete the image
	public function afterDelete() {
		$this->deleteImagem();
		return parent::afterDelete();
	}
	
	public function deleteImagem() {
		$imagem = $this->img_path;
		$path = Yii::app()->params['styleSheetImagesUploadPath'].$imagem;
		if (file_exists ($path))
			return unlink($path);
		else 
			return false;
	}
	
	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return StylesheetImages the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	protected function afterSave () {
		// Create log entry
		$log_entry = new StylesheetLog();
		$log_entry->action_type = 'create';
		$log_entry->user = Yii::app()->user->id;
		$log_entry->ss_id = $this->ss_id;
		$log_entry->action_comment = "Uploaded image {$this->img_path} for stylesheet {$this->ss->style_code}";
		$log_entry->save();
	}
	
	protected function beforeDelete () {
		// Create log entry
		$log_entry = new StylesheetLog();
		$log_entry->action_type = 'delete';
		$log_entry->user = Yii::app()->user->id;
		$log_entry->ss_id = $this->ss_id;
		$log_entry->action_comment = "Delete image {$this->img_path} from this stylesheet {$this->ss->style_code}";
		$log_entry->save();
	
		return parent::beforeDelete();
	}
}
