<?php

class ColorShadowController extends Controller
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
			$model=new ColorShadow;
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['ColorShadow']))
			{
				$model->attributes=$_POST['ColorShadow'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->color_shadow));
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
	
			if(isset($_POST['ColorShadow']))
			{
				$model->attributes=$_POST['ColorShadow'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->color_shadow));
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
			$dataProvider=new CActiveDataProvider('ColorShadow');
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
			$model=new ColorShadow('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['ColorShadow']))
				$model->attributes=$_GET['ColorShadow'];
	
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
	 * @return ColorShadow the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=ColorShadow::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param ColorShadow $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='color-shadow-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function getShadows () {
		$models = ColorShadow::model()->findAll();
		$shadows = array();
		foreach ($models as $model) {
			$shadows[$model->color_shadow] = $model->shadow_desc_e." - ".$model->shadow_desc_a;
		}
	
		return $shadows;
	}
}
