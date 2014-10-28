<?php

class StylesheetController extends Controller
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
				'actions'=>array('create','update', 'copy', 'getLogEntries', 'delete'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
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
		$model = $this->loadModel($id);
		Yii::import('application.controllers.StylesheetImagesController');
		$images = StylesheetImagesController::getStylesheetImages($id);
		Yii::import('application.controllers.StylesheetColorController');
		$colors = StylesheetColorController::getStylesheetColors($id);
		
		Yii::import('application.controllers.StylesheetBomController');
		$accessories = StylesheetBomController::getStylesheetBoms($id);
		
		$this->render('view',array(
			'model'=>$model,
			'images' => $images,
			'colors' => $colors,
			'accessories'=> $accessories
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Stylesheet;
		StylesheetController::insert($model, false);
	}
	
	public function actionCopy ($ss_id) {
		$model = $this->loadModel($ss_id);
		$model->isNewRecord=true;
		unset($model->ss_id);
		//var_dump($model);
		StylesheetController::insert ($model, true);
		
	}
	
	private function insert ($model, $copy) {
		$db_scales = Size::model()->findAll();
		
		// Create log entry
		$log_entry = new StylesheetLog();
		$log_entry->action_comment = "create stylesheet";
		$log_entry->action_type = 'create';
		$log_entry->user = Yii::app()->user->id;
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);
		
		if(isset($_POST['Stylesheet'])) {
		
			$model->attributes=$_POST['Stylesheet'];
			 
			if ($model->scale != "") {
				$sizes= Size::model()->getScaleSizes($model->scale);
				 
				$model->sizes = "";
				foreach ($sizes as $key=>$value) {
					if (isset($_POST['box'.$model->scale.$value]))
						$model->sizes.='1';
					else
						$model->sizes.='0';
				}
			}
		
			$model->user_id = Yii::app()->user->id;
		
			if ($model->save()) {
				// Create log entry
				$log_entry->ss_id = $model->ss_id;
				$log_entry->save();
					
				$this->redirect(array ('stylesheetImages/create', 'ss_id'=>$model->ss_id, ' ss_code'=>$model->style_code));
			}
		}
		
		$this->render('create',array(
				'model'=>$model,
				'scales' => $db_scales
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
		$db_scales = Size::model()->findAll();
		
		$log_entry = new StylesheetLog();
		$log_entry->action_type = 'update';
		$log_entry->ss_id = $model->ss_id;
		$log_entry->user = $model->user_id;
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model, $log_entry);
		
		// TODO Save Dept name and subclass name
		if(isset($_POST['Stylesheet'], $_POST['StylesheetLog']))
		{
			//var_dump($_POST);
			$model->attributes=$_POST['Stylesheet'];
			$log_entry->attributes = $_POST['StylesheetLog'];
			if ($model->scale != "") {
				$sizes= Size::model()->getScaleSizes($model->scale);
				$model->sizes ="";
				foreach ($sizes as $key=>$value) {
					if (isset($_POST['box'.$model->scale.$value]))
						$model->sizes.='1';
					else
						$model->sizes.='0';
				}
			}
			
			if($model->save() && $log_entry->save())
				$this->redirect(array('view','id'=>$model->ss_id));
		}

		$this->render('update',array(
			'model'=>$model,
			'scales' => $db_scales,
			'log' => $log_entry,
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
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		
		$models=Stylesheet::model()->findAll();
		//var_dump($models);
		$provider = array();
		// or using: $rawData=User::model()->findAll(); <--this better represents your question
		foreach ($models as $model)
			$provider[] = $this->loadModel($model->ss_id);
		
		$dataProvider=new CActiveDataProvider('Stylesheet', array(
            'data'=>$provider));
		
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}
	
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Stylesheet('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Stylesheet']))
			$model->attributes=$_GET['Stylesheet'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Stylesheet the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Stylesheet::model()->findByPk($id);
		
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		

		// Get brand name: brand name is the deptid name from the dept_name table
		$dept_tbl = DepartmentName::model()->tableName();
		$sql = "SELECT dept_name FROM {$dept_tbl} where dept_id='{$model->dept_id}'";
		$department["brand"] =  Yii::app()->db->createCommand($sql)->queryRow()["dept_name"];
		$department["brand"] = ($department["brand"] == "")? "No name for the following department {$model->dept_id}" : $department["brand"];
		
		// Get category name: category name is the subclassid name from the subclass_name table
		$subclass_tbl = SubclassName::model()->tableName();
		$sql = "SELECT subclass_name FROM {$subclass_tbl} where subclassid='{$model->subclass_id}'";
		$department["category"] =  Yii::app()->db->createCommand($sql)->queryRow()["subclass_name"];
		$department["category"] = ($department["category"] == "")? "No name for the following subclass {$model->subclass_id}" : $department["category"];
		
		// Get department, class, subclass names
		$sql = "SELECT deptname FROM departments where deptid='{$model->dept_id}'";
		$department["deptname"] =  Yii::app()->db->createCommand($sql)->queryRow()["deptname"];
		$sql = "SELECT subclassname FROM departments where subclassid='{$model->subclass_id}'";
		$department["subclassname"] =  Yii::app()->db->createCommand($sql)->queryRow()["subclassname"];
		$sql = "SELECT classname FROM departments where classid='{$model->class_id}'";
		$department["classname"] =  Yii::app()->db->createCommand($sql)->queryRow()["classname"];
		
		$model->brand = $department["brand"];
		$model->category = $department["category"];
		$model->dcs = $department["deptname"]. " " . $department["classname"]. " " . $department["subclassname"] . " " . $model->dcs_notes;
		$model->formatSeasons = $model->season . substr($model->year, 2, 2);
		$model->desc1 = $model->dept_id . " " . $model->class_id . " " . $model->subclass_id . " - ". $model->formatSeasons;
		$model->countryName = $model->country_id . " - " . $model->country->countrydesc;
		$model->owner = $model->user->user_name;
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Stylesheet $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='stylesheet-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	// :TODO: replace this with the size/actionGetSizesAjax
	public function fillSizesView ($model) {
		$scale =$model->scale;
		$sizes = $model->sizes;
			
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
	
	public function actionGetLogEntries ($ss_id) {
		$logsDataProvider=new CActiveDataProvider('StylesheetLog',
				array(
						'criteria'=>array('condition'=>"ss_id={$ss_id}")));
		
		$this->widget('zii.widgets.CListView', array(
				'dataProvider'=>$logsDataProvider,
				'itemView'=>"_viewLog",
		));
	}
	 
}
