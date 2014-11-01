<?php

class StylesheetBomController extends Controller
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
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update', 'addRecord', 'delete', 'admin', 'getCountryDepts'),
				'users'=>array('@'),
			),
		/*	array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			*/
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
	/*
	public function actionCreate($ss_id)
	{
		$model=array();
		$cc_model = array();
		$model[0] = new StylesheetBom();
		$cc_model[0] = new ColorCode();
		
		$ss_model = Stylesheet::model()->findByPk($ss_id);
		
		$this->performAjaxValidation($model);
		
		$allSaved = false;
		
		if(isset($_POST['StylesheetBom'], $_POST['ColorCode'])) {
			foreach ($_POST['ColorCode'] as $i=>$record) {
				
				// Set color values
				$cc_model[$i] = new ColorCode;
				$cc_model[$i]->setAttributes($record);
				$cc_model[$i]->color_code = "dummy";
				
				// Set stylesheet bom values
				$model[$i] = new StylesheetBom;
				$model[$i]->setAttributes($_POST['StylesheetBom'][$i]);
				$model[$i]->ss_id = $ss_id;
				
				if ($cc_model[$i]->validate()) {
					Yii::import('application.controllers.ColorCodeController');
					$cc_model_properties = ColorCodeController::setModelProperties($cc_model[$i], false, false);
					
					// If there is a record for this color code, use its color code
					if (!is_null($cc_model_properties["lastModel"])) {
						$model[$i]->item_color_id = $cc_model_properties["lastModel"]->color_code;
					} else {
						$cc_model[$i] = $cc_model_properties["model"];
						$cc_model[$i]->save(false);
						$model[$i]->item_color_id = $cc_model[$i]->color_code;
							
					}
				}
				
				if($model[$i]->save())
					$allSaved = true;
				else 
					$allSaved = false;
			}
			
			if ($allSaved)
					$this->redirect(array('index', 'ss_id'=>$ss_id));
			
		}
		
		$this->render('create',array(
			'model'=>$model,
			'cc_model'=> $cc_model,
			'ss_model' => $ss_model,
		));
	}
	*/
	
	public function actionCreate($ss_id)
	{
		$model = new StylesheetBom;
		$cc_model = new ColorCode;
		$model->ss_id = $ss_id;
		$cc_model->color_code = "dummy";
		
		$ss_model = Stylesheet::model()->findByPk($ss_id);
	
		$this->performAjaxValidation($model,$cc_model);
	
		if(isset($_POST['StylesheetBom'], $_POST['ColorCode'])) {
				// Set color values
				var_dump($_POST);
				$cc_model->attributes = $_POST['ColorCode'];
				
	
				// Set stylesheet bom values
				
				$model->attributes = $_POST['StylesheetBom'];
				
	
				if ($cc_model->validate()) {
					Yii::import('application.controllers.ColorCodeController');
					$cc_model_properties = ColorCodeController::setModelProperties($cc_model, false, false);
						
					// If there is a record for this color code, use its color code
					if (!is_null($cc_model_properties["lastModel"])) {
						$model->item_color_id = $cc_model_properties["lastModel"]->color_code;
					} else {
						$cc_model = $cc_model_properties["model"];
						$cc_model->save(false);
						$model->item_color_id = $cc_model->color_code;
							
					}
				}
		
			if ($model->save())
				$this->redirect(array('index', 'ss_id'=>$ss_id));
				
		}
	
		$this->render('create',array(
				'model'=>$model,
				'cc_model'=> $cc_model,
				'ss_model' => $ss_model,
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
		$cc_model = ColorCode::model()->findByPk($model->item_color_id);
		$ss_model = Stylesheet::model()->findByPk($model->ss_id);
		if($cc_model===null)
			throw new CHttpException(404,'The requested color code page does not exist.');
		if($ss_model===null)
			throw new CHttpException(404,'The requested stylesheet page does not exist.');
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model, $cc_model);
		
		if(isset($_POST['StylesheetBom'], $_POST['ColorCode']))
		{
			
			$model->attributes=$_POST['StylesheetBom'];
			//$cc_model->unsetAttributes();
			$cc_model->attributes= $_POST['ColorCode'];
			$cc_model->color_code = "dummy";
			
			if ($cc_model->validate()) {
				var_dump($cc_model->color);
				Yii::import('application.controllers.ColorCodeController');
				$cc_model_properties = ColorCodeController::setModelProperties($cc_model, false, false);
					
				// If there is a record for this color code, use its color code
				if (!is_null($cc_model_properties["lastModel"])) {
					$model->item_color_id = $cc_model_properties["lastModel"]->color_code;
				} else {
					$cc_model = $cc_model_properties["model"];
					$cc_model->save(false);
					$model->item_color_id = $cc_model->color_code;
						
				}
				
				if($model->save())
					$this->redirect(array('view','id'=>$model->ss_bom_id));
			}
		}

		$this->render('update',array(
			'model'=>$model,
			'cc_model' => $cc_model,
			'ss_model' => $ss_model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex($ss_id)
	{
		$dataProvider=new CActiveDataProvider('StylesheetBom', array('criteria'=>array(
						'condition'=>"ss_id={$ss_id}",
				)));
		$ss_model = Stylesheet::model()->findByPk($ss_id);
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
			'ss_model' => $ss_model,
		));
	}
	
	
	
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new StylesheetBom('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['StylesheetBom']))
			$model->attributes=$_GET['StylesheetBom'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return StylesheetBom the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=StylesheetBom::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param StylesheetBom $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='stylesheet-bom-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function actionAddRecord($model=NULL, $cc_model=NULL) {
		$i = $_SESSION['count'];
		if (is_null($model))
			$model = new StylesheetBom();
		if (is_null($cc_model))
			$cc_model = new ColorCode();
		echo "<div id = 'stylesheet_bom' class='row' style='border-radius: 5px; background: #EFEFEF; padding: 10px;'>";
		$this->renderPartial('_additionalBom', array('i'=>$i, 'model'=>$model, 'cc_model'=>$cc_model));
		echo "</div>";
		$_SESSION['count']++;
		
	}
	
	public function getStylesheetBoms ($ss_id) {
		$dataProvider=new CActiveDataProvider('StylesheetBom', array(
				'criteria'=>array(
						'condition'=>"ss_id={$ss_id}",
				),
		));
		return $dataProvider;
	}
	
	public function actionGetCountryDepts() {
		if (isset($_POST["StylesheetBom"]["countryid"])) {
			$models = Departments::model()->findAllByAttributes(array('countryid'=>$_POST["StylesheetBom"]["countryid"]));
			foreach ($models as $model) {
				$name = $model->fulldept. " - ".$model->deptname.' '. $model->classname.' '.$model->subclassname;
				echo "<option value='{$model->fulldept}'>{$name}</option>";
				
			}
		}
	}
	
}
