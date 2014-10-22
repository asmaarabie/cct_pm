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
	public function actionCreate($ss_id, $ss_code)
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
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation(array($model, $cc_model));

		if(isset($_POST['StylesheetColor'], $_POST['ColorCode']))
		{
			$model->attributes=$_POST['StylesheetColor'];
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

		$this->render('create',array(
			'model'=>$model,
			'cc_model' => $cc_model,
			'ss_id' => $ss_id, 'ss_code' => $ss_code
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id, $ss_code)
	{
		$model=$this->loadModel($id);
		
		$this->performAjaxValidation($model);


		if(isset($_POST['StylesheetColor']))
		{
			$model->attributes=$_POST['StylesheetColor'];
			if ($model->save());
				$this->redirect(array('index','ss_id'=>$model->ss_id));
		}

		$this->render('update',array(
			'model'=>$model,
			'ss_id' => $model->ss_id, 'ss_code' => $ss_code
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id, $ss_id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index', 'ss_id'=> $ss_id));
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
	
		$dataProvider = StylesheetColorController::getStylesheetColors($ss_id);
		// Load Stylesheet model
		Yii::import('application.controllers.StylesheetController');
		$ss_model = StylesheetController::loadModel($ss_id);
	
		$this->render('index',array(
				'dataProvider'=>$dataProvider,
				'ss_model' => $ss_model
		));
	
	}
	

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new StylesheetColor('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['StylesheetColor']))
			$model->attributes=$_GET['StylesheetColor'];

		$this->render('admin',array(
			'model'=>$model,
		));
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
}
