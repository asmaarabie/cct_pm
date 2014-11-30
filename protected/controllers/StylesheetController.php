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
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('getDCSScale'),
				'users'=>array('@'),
			),
			
			/*array('deny',  // deny all users
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
		if (Yii::app()->authManager->checkAccess('viewStylesheet', Yii::app()->user->id)) {
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
				'accessories'=> $accessories,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionExportToPDF($id) {
		if (Yii::app()->authManager->checkAccess('viewStylesheet', Yii::app()->user->id)) {
			$model= $this->loadModel($id);
			$images= StylesheetImages::model()->findAllByAttributes(array('ss_id'=>$id));
			
			if(isset($_POST['selected_pic']) || count ($images)==0)
			{
					$selected = isset ($_POST['selected_pic'])? $_POST['selected_pic']: "";
					$image = StylesheetImages::model()->findByPk($selected);
					$accessories = StylesheetBom::model()->findAllByAttributes(array('ss_id'=>$id));
					Yii::import('application.controllers.StylesheetColorController');
					$colors = StylesheetColorController::getStylesheetColors($id);
					
					$html2pdf = Yii::app()->ePdf->mPDF('','', 10, 'Tahoma', 7, 7, 7, 7, 0, 0, '');
					
					$html2pdf->WriteHTML($this->renderPartial('stylesheetPrintView', array(
							'model'=>$model,
							'image' => $image,
							'colors' => $colors,
							'accessories'=> $accessories
					), true));
					$html2pdf->Output();
			}
			
			$this->render('pickImage',array(
					'images'=>$images,
					'model' => $model,
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
		if (Yii::app()->authManager->checkAccess('createStylesheet', Yii::app()->user->id)) {
			$model=new Stylesheet;
			StylesheetController::insert($model, false);
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionCopy ($ss_id) {
		if (Yii::app()->authManager->checkAccess('createStylesheet', Yii::app()->user->id)) {
			$model = $this->loadModel($ss_id);
			$model->isNewRecord=true;
			unset($model->ss_id);
			//var_dump($model);
			StylesheetController::insert ($model, true);
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
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
			$dept = Departments::model()->findByAttributes(array('countryid'=>2, 'fulldept'=>$model->fulldept));
			$model->country_id = 2; 
			$model->dept_id = $dept->deptid; 
			$model->class_id = $dept->classid; 
			$model->subclass_id = $dept->subclassid;
			
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
		if (Yii::app()->authManager->checkAccess('updateStylesheet', Yii::app()->user->id) || 
		(Yii::app()->authManager->checkAccess('updateOwnStylesheet', Yii::app()->user->id) && Yii::app()->user->id ==$model->user_id)
		) {
			
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
		if (Yii::app()->authManager->checkAccess('deleteStylesheet', Yii::app()->user->id)||
		(Yii::app()->authManager->checkAccess('deleteOwnStylesheet', Yii::app()->user->id) && Yii::app()->user->id ==$model->user_id)
		) {
			$model->delete();
	
			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		if (Yii::app()->authManager->checkAccess('viewStylesheet', Yii::app()->user->id)) {
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
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		if (Yii::app()->authManager->checkAccess('adminStylesheet', Yii::app()->user->id)) {
		    $model=new Stylesheet('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Stylesheet']))
				$model->attributes=$_GET['Stylesheet'];
	
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
	 * @return Stylesheet the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Stylesheet::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
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
		if (Yii::app()->authManager->checkAccess('viewStylesheet', Yii::app()->user->id)) {
			$logsDataProvider=new CActiveDataProvider('StylesheetLog',
					array(
							'criteria'=>array('condition'=>"ss_id={$ss_id}")));
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
	
	public function actionGetDCSScale () {
		if (isset($_POST["Stylesheet"]["fulldept"])) {
			$options = DCSSizeScale::model()->findAllByAttributes(array('size_fulldept'=> $_POST["Stylesheet"]["fulldept"]));
			echo "<option value>Select a scale</option>";
			foreach($options as $opt) {
				echo "<option value='{$opt['size_scale']}'>{$opt['sizeScale']->scale_name}</option>";
				
			}
		}
	}
	
}
