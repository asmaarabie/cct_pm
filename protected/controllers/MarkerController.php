<?php

class MarkerController extends Controller
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
				'actions'=>array('view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','delete', 'getLogEntries', 'manage'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin'),
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
	public function actionCreate($ss_id)
	{
		$model=new Marker;
		$model->ss_id = $ss_id;
		$model->owner = Yii::app()->user->id;
		
		// Create a log for the marker
		$log = new MarkerLog();
		$log->action_type = "create";
		$log->user = Yii::app()->user->id;
		$log->action_comment = "Creating a new marker for stylesheet {$model->ss->style_code}";
		
		// Create a log for the stylesheet
		$ss_log = new StylesheetLog();
		$ss_log->action_comment = $log->action_comment;
		$ss_log->user = Yii::app()->user->id;
		$ss_log->action_type= 'create';
		$ss_log->ss_id = $ss_id;
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['Marker']))
		{
			$model->attributes=$_POST['Marker'];
			if($model->save()) {
				$log->marker_id = $model->marker_id;
				$log->save();
				$ss_log->save();
				$this->redirect(array('view','id'=>$model->marker_id));
			}
				
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		$log = new MarkerLog();
		$log->action_type = "update";
		$log->user = Yii::app()->user->id;
		$log->marker_id = $model->marker_id;
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model, $log);

		if(isset($_POST['Marker'], $_POST['MarkerLog']))
		{
			$model->attributes=$_POST['Marker'];
			$log->attributes = $_POST['MarkerLog'];
			if($model->save() && $log->save())
				$this->redirect(array('view','id'=>$model->marker_id));
		}

		$this->render('update',array(
			'model'=>$model,
			'log' => $log
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$model = $this->loadModel($id);
		$ss_id = $model->ss_id;
		$model->delete();
		
		// Create a log for the stylesheet
		$ss_log = new StylesheetLog();
		$ss_log->action_comment = 'Deleted the marker';
		$ss_log->user = Yii::app()->user->id;
		$ss_log->action_type= 'delete';
		$ss_log->ss_id = $ss_id;
		$ss_log->save();
		
		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(array('stylesheet/view', 'id'=> $ss_id));
	}

	/**
	 * Lists all models.
	 */
	/*
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Marker');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}
	*/
	public function actionManage ($ss_id) {
		$model = Marker::model()->findByAttributes (array ('ss_id'=>$ss_id));
		
		if ($model!=NULL)
			$this->actionView($model->marker_id);
		else 
			$this->actionCreate($ss_id);
	}
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Marker('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Marker']))
			$model->attributes=$_GET['Marker'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Marker the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Marker::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Marker $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='marker-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function actionGetLogEntries ($marker_id) {
		$logsDataProvider=new CActiveDataProvider('MarkerLog',
				array(
						'criteria'=>array('condition'=>"marker_id={$marker_id}")));
	
		$this->widget('zii.widgets.CListView', array(
				'dataProvider'=>$logsDataProvider,
				'itemView'=>"_viewLog",
		));
	}
}
