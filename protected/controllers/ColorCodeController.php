<?php

class ColorCodeController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view', 'getColorAjax', 'getParamAjax'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new ColorCode;

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);
		
		// Create the color code
		//:TODO: 
		
		if(isset($_POST['ColorCode']))
		{
			$model->attributes=$_POST['ColorCode'];
			$increment = isset($_POST['box'])? true:false ;
			$model= ColorCodeController::setModelProperties($model, $increment) ["model"];
			
			if($model->save())
				$this->redirect(array('view','id'=>$model->color_code));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}
	
	public function setModelProperties ($model, $increment) {
		$model->color_serial = "00";
		$lastModel = NULL;
		$data = Yii::app()->db->createCommand(
			"SELECT * FROM color_code WHERE
			shadow='{$model->shadow}' AND
			color='{$model->color}' AND
			shape='{$model->shape}' AND
			length='{$model->length}' AND
			pattern='{$model->pattern}'
			ORDER BY color_serial DESC")
			->queryAll();
		
		$serial = $data[0]['color_serial'];
		if (isset($serial)) 
			$lastModel=ColorCode::model()->findByPk($data[0]['color_code']);
		
		if ($increment) {
			$newSerial = intval($data[0]['color_serial']) +1;
			// padding number 1-> 01, 2 -> 02
			$model->color_serial = str_pad($newSerial, 2, '0', STR_PAD_LEFT);
				
		}
		
		// Pad color with extra '-' if the color's length is less than 2
		$color = $model->color;
		if (strlen($model->color)<2)
			$color .= '-';
			$model->color_code = $color.$model->shadow.$model->pattern.$model->length.$model->shape.$model->color_serial;
		//var_dump($lastModel);
		return array ('model'=> $model, 'lastModel' =>$lastModel);
	}
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['ColorCode']))
		{
			
			$model->attributes=$_POST['ColorCode'];
			
			if($model->save())
				$this->redirect(array('view','id'=>$model->color_code));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}
	
	public function actionGetColorAjax(){
	
		$request=trim($_GET['term']);
		if($request!=''){
			$data = Yii::app()->db->createCommand()
			->selectDistinct('*')
			->from('color')
			->where(array('like', 'color_id', "$request%"))
			->queryAll();
	
			$return_array = array();
			foreach($data as $sub) {
				$return_array[] = array(
						'label'=>$sub['color_desc_e'].' - '.$sub['color_desc_a'],
						'value'=>$sub['color_id'],
						'id'=>$sub['color_id'],
						'img' => Yii::app()->request->baseUrl.Yii::app()->params["colorUploadUrl"].$sub['color_img']
				);
			}
	
			$this->layout='empty';
			echo json_encode($return_array);
	
		}
	
	}
	
	public function actionGetParamAjax(){
		$param=$_GET['param'];
		$request=trim($_GET['term']);
		if($request!=''){
			$data = Yii::app()->db->createCommand()
			->selectDistinct('*')
			->from("color_{$param}")
			->where(array('like', "color_{$param}", "$request%"))
			->queryAll();
	
			$return_array = array();
			foreach($data as $sub) {
				$return_array[] = array(
						'label'=>$sub["{$param}_desc_e"].' - '.$sub["{$param}_desc_a"],
						'value'=>$sub["color_{$param}"],
						'id'=>$sub["color_{$param}"],
				);
			}
	
			$this->layout='empty';
			echo json_encode($return_array);
		}
	}
	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('ColorCode');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new ColorCode('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['ColorCode']))
			$model->attributes=$_GET['ColorCode'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return ColorCode the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=ColorCode::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param ColorCode $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='color-code-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
