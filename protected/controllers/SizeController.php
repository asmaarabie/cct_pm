<?php

class SizeController extends Controller
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
				'actions'=>array('getSizeScaleNumAjax', 'getSizesAjax'),
				'users'=>array('@'),
			),
			/*
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
		if (Yii::app()->authManager->checkAccess('viewSizeScale', Yii::app()->user->id)) {
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
		if (Yii::app()->authManager->checkAccess('createSizeScale', Yii::app()->user->id)) {
			$model=new Size;
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Size']))
			{
				$model->attributes=$_POST['Size'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->scale_number));
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
		if (Yii::app()->authManager->checkAccess('updateSizeScale', Yii::app()->user->id)) {
			$model=$this->loadModel($id);
	
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Size']))
			{
				$model->attributes=$_POST['Size'];
				if($model->save())
					$this->redirect(array('view','id'=>$model->scale_number));
			}
	
			$this->render('update',array(
				'model'=>$model,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	/*
	 * Gets the scale number and name on ajax autocomplete request
	 */
	public function actionGetSizeScaleNumAjax(){
	
		$request=trim($_GET['term']);
		if($request!=''){
			$data = Yii::app()->db->createCommand()
			->selectDistinct('*')
			->from('size')
			->where(array('like', 'scale_number', "$request%"))
			->queryAll();
	
			$return_array = array();
			foreach($data as $sub) {
				$return_array[] = array(
						'label'=>$sub['scale_number'].': '.$sub['scale_name'],
						'value'=>$sub['scale_number'],
						'id'=>$sub['scale_number'],
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
		if (Yii::app()->authManager->checkAccess('deleteSizeScale', Yii::app()->user->id)) {
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
		if (Yii::app()->authManager->checkAccess('indexSizeScale', Yii::app()->user->id)) {
			$dataProvider=new CActiveDataProvider('Size');
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
		if (Yii::app()->authManager->checkAccess('adminSizeScale', Yii::app()->user->id)) {
			$model=new Size('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Size']))
				$model->attributes=$_GET['Size'];
	
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
	 * @return Size the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Size::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Size $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='size-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function actionGetSizesAjax () {
			$scale =$_POST['Stylesheet']['scale'];
			$sizes = $_POST['Stylesheet']['sizes'];
			
			if ($scale != "") {
				$options = Size::model()->getScaleSizes($scale);
				echo CHtml::label ('Sizes', 'label_size');
				for ($i = 0 ; $i < count ($options); $i++) {
					echo "<span style='float:left; margin: 10px 10px 10px 0'>".CHtml::label ($options[$i], 'label_box'.$i);
					if ($sizes != "") {
						$check = substr($sizes, $i, 1);
					} else 
						$check = 0;
					echo CHtml::checkBox('box'.$scale.$options[$i], $check)."</span>";
				}
				echo "<div style='clear:both;'></div>";
			}
	}
}
