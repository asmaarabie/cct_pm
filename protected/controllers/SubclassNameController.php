<?php

class SubclassNameController extends Controller
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
				'actions'=>array('index','view','getSubclassesAjax'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update', 'getCountrySubclasses', 'admin','delete'),
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
			$model=new SubclassName;
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['SubclassName']))
			{
				$model->attributes=$_POST['SubclassName'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->subclassid));
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
	
			if(isset($_POST['SubclassName']))
			{
				$model->attributes=$_POST['SubclassName'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->subclassid));
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
		if ($this->can('view')) {
			$dataProvider=new CActiveDataProvider('SubclassName');
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
			$model=new SubclassName('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['SubclassName']))
				$model->attributes=$_GET['SubclassName'];
	
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
	 * @return SubclassName the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=SubclassName::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param SubclassName $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='subclass-name-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	
	public function actionGetCountrySubclasses($cond = -1) {
		if (isset($_POST["SubclassName"]["countryid"])) {
			$cond = $_POST["SubclassName"]["countryid"];
			$data = SubclassNameController::getSubclassesQuery($cond);
			foreach($data as $sub) {
				echo "<option value='{$sub['subclassid']}'>{$sub['subclassid']} - {$sub['subclassname']}</option>";
				
			}
		} elseif ($cond != -1) {
			$data = SubclassNameController::getSubclassesQuery ($cond);
			$subclasses = array();
			foreach($data as $sub) {
				$subclasses[$sub['subclassid']] = $sub['subclassid'] . (($sub['subclassname']!="")? " - " . $sub['subclassname'] : "");
			}
				
			return $subclasses;
		}
	}
	
	protected function getSubclassesQuery ($cond) {
	
		$data = Yii::app()->db->createCommand()
		->selectDistinct('subclassname, subclassid')
		->from('departments')
		->where(array('like', 'countryid', "$cond"))
		->queryAll();
		return $data;
	}
	public function can ($resp) {
		return (Yii::app()->authManager->checkAccess("{$resp}DCSName", Yii::app()->user->id));
	}
}
