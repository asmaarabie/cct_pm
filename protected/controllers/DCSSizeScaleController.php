<?php

class DCSSizeScaleController extends Controller
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
		if ($this->can('view')) {
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
		if ($this->can('create')) {
			$model=new DCSSizeScale;
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['DCSSizeScale']))
			{
				$model->attributes=$_POST['DCSSizeScale'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->DCS_size_id));
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
		if ($this->can('update')) {
			$model=$this->loadModel($id);
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['DCSSizeScale']))
			{
				$model->attributes=$_POST['DCSSizeScale'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->DCS_size_id));
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
		if ($this->can('delete')) {
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
		if (Yii::app()->authManager->checkAccess('viewSizeScale', Yii::app()->user->id)) {
			$dataProvider=new CActiveDataProvider('DCSSizeScale');
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
		if ($this->can('admin')) {
			$model=new DCSSizeScale('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['DCSSizeScale']))
				$model->attributes=$_GET['DCSSizeScale'];
	
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
	 * @return DCSSizeScale the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=DCSSizeScale::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param DCSSizeScale $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='dcssize-scale-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function getDCSSizeScalesModels ($dcs, $country) {
		$models = DCSSizeScale::model()->findAll("size_fulldept='{$dcs}' and size_country_id='{$country}'");
		return $models;
	}
	
	public function actionGetCountryDepts($cond = -1) {
		if (isset($_POST["DCSSizeScale"]["size_country_id"])) {
			$cond = $_POST["DCSSizeScale"]["size_country_id"];
			$data = DCSSizeScaleController::getDeptsQuery($cond);
			foreach($data as $sub) {
				echo "<option value='{$sub['fulldept']}'>{$sub['fulldept']} - {$sub['deptname']} {$sub['classname']} {$sub['subclassname']}</option>";
	
			}
		} elseif ($cond != -1) {
			$data = DCSSizeScaleController::getDeptsQuery($cond);
			$depts = array();
			foreach($data as $sub) {
				$depts[$sub['fulldept']] = "{$sub['fulldept']} - {$sub['deptname']} {$sub['classname']} {$sub['subclassname']}";
			}
	
			return $depts;
		}
	}
	
	protected function getDeptsQuery ($cond) {

		$data = Yii::app()->db->createCommand()
		->selectDistinct('fulldept, deptname, subclassname, classname')
		->from('departments')
		->where(array('like', 'countryid', "$cond"))
		->queryAll();
		return $data;
	}
			
	public function can ($resp) {
		return (Yii::app()->authManager->checkAccess("{$resp}SizeScale", Yii::app()->user->id));
	}
}
