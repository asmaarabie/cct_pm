<?php

class ColorController extends Controller
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
				/*
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
			*/
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		if (Yii::app()->authManager->checkAccess('viewColorCode', Yii::app()->user->id)) {
			$this->render('view',array(
				'model'=>$this->loadModel($id),
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		
		if (Yii::app()->authManager->checkAccess('createColorCode', Yii::app()->user->id)) {
			$model=new Color;
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Color']))
			{
				$model->attributes=$_POST['Color'];
				$uploadedFile=CUploadedFile::getInstance($model,'color_img');
	            $fileName = "{$uploadedFile}";  //file name
	            $model->color_img = $fileName;
	            
	            if($model->validate())
	            {
	            	$path = Yii::app()->params['colorUploadPath'].$fileName;
	            	if (file_exists ($path))
	            		Yii::app()->user->setFlash("color_create", "This image file '{$path}' exists, kindly rename the file and upload it again");
	            	elseif ($uploadedFile->saveAs($path)) {
						$model->save();
						$this->redirect(array('view','id'=>$model->color_id));
	            	}
	            	else 
	            		Yii::app()->user->setFlash("color_create", "Cannot save this image '{$path}'");
	            		
					
				}
			}
	
			$this->render('create',array(
				'model'=>$model,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		if (Yii::app()->authManager->checkAccess('updateColorCode', Yii::app()->user->id)) {
			$model=$this->loadModel($id);
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Color']))
			{
				$_POST['Color']['color_img'] = $model->color_img;
				$model->attributes=$_POST['Color'];
				$uploadedFile=CUploadedFile::getInstance($model,'color_img');
				
				if($model->validate())
	            {
	            	if (!empty($uploadedFile)) {
	            		$fileName = "{$uploadedFile}";  //file name
	            		$model->color_img = $fileName;
	            		$uploadedFile->saveAs(Yii::app()->params['colorUploadPath'].$model->color_img);  // image will uplode to rootDirectory/banner/
	            	
	            	}
					$model->save();
	            	$this->redirect(array('view','id'=>$model->color_id));
					
				}
			}
	
			$this->render('update',array(
				'model'=>$model,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if (Yii::app()->authManager->checkAccess('deleteColorCode', Yii::app()->user->id)) {
			$this->loadModel($id)->delete();
	
			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		if (Yii::app()->authManager->checkAccess('viewColorCode', Yii::app()->user->id)) {
			$dataProvider=new CActiveDataProvider('Color');
			$this->render('index',array(
				'dataProvider'=>$dataProvider,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		if (Yii::app()->authManager->checkAccess('adminColorCode', Yii::app()->user->id)) {
			$model=new Color('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Color']))
				$model->attributes=$_GET['Color'];
	
			$this->render('admin',array(
				'model'=>$model,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Color the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Color::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Color $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='color-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function getColors () {
		$models = Color::model()->findAll();
		$colors = array();
		//$colors["images"] = array(); $colors["images"]["options"] = array();
		//$colors["options"] = array();
		foreach ($models as $model) {
			///$colors["images"]["options"][$model->color_id] = array ("style"=> "background-image:url(".Yii::app()->params['colorUploadPath'].$model->color_img.")");
			$colors[$model->color_id] = $model->color_desc_e." - ".$model->color_desc_a;
		}
		
		return $colors;
	}
}
