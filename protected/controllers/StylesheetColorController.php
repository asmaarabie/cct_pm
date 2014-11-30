<?php

class StylesheetColorController extends Controller
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
						'actions'=>array('getStylesheetColors'),
						'users'=>array('@'),
				),
				/*
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update', 'delete'),
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
		$model=new StylesheetColor;
		$model->ss_id = $ss_id;
		$cc_model = new ColorCode;
		$model->emb = 0;
		$model->print = 0;
			
		// Create log entry
		$log_entry = new StylesheetLog();
		$log_entry->action_type = 'create';
		$log_entry->user = Yii::app()->user->id;
		$log_entry->ss_id = $ss_id;
		StylesheetColorController::insert($model, $cc_model, $log_entry, true);
	}
	
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		$cc_model= ColorCode::model()->findByPk($model->color_code);
		// Create log entry
		$log_entry = new StylesheetLog();
		$log_entry->action_type = 'create';
		$log_entry->user = Yii::app()->user->id;
		$log_entry->ss_id = $model->ss_id;
		StylesheetColorController::insert($model, $cc_model, $log_entry, false);
	}
	
	public function insert($model, $cc_model, $log_entry, $new)
	{
		$ss_model = Stylesheet::model()->findByPk($model->ss_id);
		
		// We're actually modifying the mother sheet, so it's an update
		if ($this->can('update', $ss_model)) {
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation(array($model, $cc_model));
	
			if(isset($_POST['StylesheetColor'], $_POST['ColorCode']))
			{
					
				$model->attributes=$_POST['StylesheetColor'];
				$cc_model = new ColorCode;
				$model->color_code=NULL;
				$cc_model->attributes=$_POST['ColorCode'];
				
				// use false parameter to disable validation
				$increment = isset($_POST['box'])? true:false ;
				
				Yii::import('application.controllers.ColorCodeController');
				$cc_model_properties = ColorCodeController::setModelProperties($cc_model, $increment);
				
				$existing = "a new";
				// If there is a record for this color code, and the increment is not set, use the latest record color code
				if (!is_null($cc_model_properties["lastModel"]) && !$increment) {
					$cc_model= $cc_model_properties["lastModel"];
					$model->color_code = $cc_model->color_code;
					$existing = "an existing";
				// If there isn't a record for this color code || the increment is set, use create a new color code
				} else {
					$cc_model= $cc_model_properties["model"];
					if ($cc_model->validate()) {
						$cc_model->save(false);
						$model->color_code = $cc_model->color_code;
					}
				}
	
				if($model->validate()) {
					$model->save(false);
					$log_entry->action_comment = "Add {$existing} Color: ".$model->color_code;
					$log_entry->save();
					$this->redirect(array('index','ss_id'=>$model->ss_id));
				}
					
			}
			
			$this->render(($new)? 'create' : 'update',array(
				'model'=>$model,
				'cc_model' => $cc_model,
				'ss_model' => $ss_model
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
	
	public function getStylesheetColors ($ss_id) {
		$dataProvider=new CActiveDataProvider('StylesheetColor', array(
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
			$dataProvider = StylesheetColorController::getStylesheetColors($ss_id);
			$ss_model = Stylesheet::model()->findByPk($ss_id);
		
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
	 * @return StylesheetColor the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=StylesheetColor::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param StylesheetColor $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='stylesheet-color-form')
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
