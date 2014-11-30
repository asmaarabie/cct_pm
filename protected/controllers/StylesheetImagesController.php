<?php

class StylesheetImagesController extends Controller
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
				array('allow', // allow authenticated user to perform 'create' and 'update' actions
						'actions'=>array('getStylesheetImages'),
						'users'=>array('@'),
				),
				
				/*
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create', 'delete'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
			*/
		);
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($ss_id)
	{
		// We're actually modifying the mother stylesheet, so it's an update
		$ss_model = Stylesheet::model()->findByPk($ss_id);
		if ($this->can('update', $ss_model)) {
			$model=new StylesheetImages;
			$model->ss_id = $ss_id;
			
			//$this->performAjaxValidation($model);
	
			if(isset($_POST['StylesheetImages']))
			{
				$model->attributes=$_POST['StylesheetImages'];
				$uploadedFile=CUploadedFile::getInstance($model,'img_path');
	            $fileName = "{$uploadedFile}";  //file name
	            $model->img_path = $fileName;
	            
	            if($model->validate())
	            {
	            	$path = Yii::app()->params['styleSheetImagesUploadPath'].$fileName;
	            	if (file_exists ($path))
	            		Yii::app()->user->setFlash('ss_img_create',"This image file '{$path}' exists, kindly rename the file and upload it again");
	            	elseif ($uploadedFile->saveAs($path)) {
						$model->save();
		            	$this->redirect(array('stylesheet/view','id'=>$ss_id));
	            	} else {
	            		Yii::app()->user->setFlash('ss_img_create',"Cannot save this image '{$path}'");
	            	}
				}
			}
	
			$this->render('create',array(
				'model'=>$model, 'ss_model' => $ss_model
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
	public function actionDelete($id, $ss_id)
	{
		
		$ss_model = Stylesheet::model()->findByPk($ss_id);
		if ($this->can('update', $ss_model)) {
			$this->loadModel($id)->delete();
	
			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index', 'ss_id'=> $ss_id));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	// Get all stylesheet with id = $ss_id images.
	public function getStylesheetImages ($ss_id) {
		$dataProvider=new CActiveDataProvider('StylesheetImages', array(
				'criteria'=>array(
						'condition'=>"ss_id={$ss_id}",
				),
				));
		return $dataProvider;
	}
	/**
	 * Lists all models.
	 */
	public function actionIndex($ss_id)
	{
		if ($this->can('view')) {
			$dataProvider = StylesheetImagesController::getStylesheetImages($ss_id);
			// Load Stylesheet model
			Yii::import('application.controllers.StylesheetController');
			$ss_model = StylesheetController::loadModel($ss_id);
			
			$this->render('index',array(
				'dataProvider'=>$dataProvider,
				'ss_model' => $ss_model
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return StylesheetImages the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=StylesheetImages::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param StylesheetImages $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='stylesheet-images-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function can ($resp, $model=NULL) {
		return (Yii::app()->authManager->checkAccess("{$resp}Stylesheet", Yii::app()->user->id)||
		(
				$model !== NULL &&
				($resp=='update' || $resp== 'delete') &&
				Yii::app()->authManager->checkAccess("{$resp}OwnStylesheet", Yii::app()->user->id)&&
				Yii::app()->user->id == $model->user_id));
	}
}
