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
				/*
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','delete', 'getLogEntries', 'manage', 'index', 'copy', 'exportToPDF'),
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
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		if (Yii::app()->authManager->checkAccess('viewMarker', Yii::app()->user->id)) {
			$this->render('view',array(
				'model'=>$this->loadModel($id),
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	public function actionCreate($ss_id)
	{
		if (Yii::app()->authManager->checkAccess('createMarker', Yii::app()->user->id)) {
			$model=new Marker;
			$model->ss_id = $ss_id;
			MarkerController::insert($model, false);
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionCopy ($id) {
		if (Yii::app()->authManager->checkAccess('createMarker', Yii::app()->user->id)) {
			$model = $this->loadModel($id);
			unset($model->marker_id);// = "";
			$model->isNewRecord=true;
			unset($model->id);
			MarkerController::insert ($model, true);
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function insert($model, $copy)
	{
		$model->owner = Yii::app()->user->id;
		
		// :TODO: move this to the model in after save
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
		$ss_log->ss_id = $model->ss_id;
		
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
		if (Yii::app()->authManager->checkAccess('updateMarker', Yii::app()->user->id) || 
		(Yii::app()->authManager->checkAccess('updateOwnMarker', Yii::app()->user->id) && $model->owner == Yii::app()->user->id)
		) {
			
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
		$model = $this->loadModel($id);
		if (Yii::app()->authManager->checkAccess('deleteMarker', Yii::app()->user->id) ||
		(Yii::app()->authManager->checkAccess('deleteOwnMarker', Yii::app()->user->id) && $model->owner == Yii::app()->user->id)
		) {
			
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
				$this->redirect(array('marker/index', 'ss_id'=> $ss_id));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Lists all models.
	 */
	
	public function actionIndex($ss_id)
	{
		if (Yii::app()->authManager->checkAccess('viewMarker', Yii::app()->user->id)) {
			$dataProvider=new CActiveDataProvider('Marker', array(
					'criteria'=>array(
							'condition'=>"ss_id={$ss_id}",
					),
			));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			$this->render('index',array(
				'dataProvider'=>$dataProvider,
				'ss_model' => $ss_model,
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
		if (Yii::app()->authManager->checkAccess('adminMarker', Yii::app()->user->id)) {
			$model=new Marker('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Marker']))
				$model->attributes=$_GET['Marker'];
	
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
		if (Yii::app()->authManager->checkAccess('viewMarker', Yii::app()->user->id)) {
			$logsDataProvider=new CActiveDataProvider('MarkerLog',
					array(
							'criteria'=>array('condition'=>"marker_id={$marker_id}")));
		
			if (Yii::app()->request->isAjaxRequest) {
				$done =$this->renderPartial('viewLog', array('logsDataProvider' =>
						$logsDataProvider), false, true);
				echo $done;
				Yii::app()->end();
			}
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionExportToPDF($ss_id) {
		if (Yii::app()->authManager->checkAccess('viewMarker', Yii::app()->user->id)) {
			// Get this stylsheet's design bom items (Style sheet)
			$markers = Marker::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			$html2pdf = Yii::app()->ePdf->mPDF('','', 10, 'Tahoma', 7, 7, 7, 7, 0, 0, 'L');
		
			$html2pdf->WriteHTML($this->renderPartial('markerPrintView', array(
					'markers'=>$markers,
					'model' => $ss_model
			), true));
			$html2pdf->Output();
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
}
