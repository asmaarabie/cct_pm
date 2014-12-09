<?php

class BomsheetController extends Controller
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
			$model = $this->loadModel($id);
			$ss_model = Stylesheet::model()->findByPk($model->ss_id);
			$sizes  = SsSizeQty::model()->findAllByAttributes(array('bs_id'=>$id));
			$ssBomItemsDataProvider=new CActiveDataProvider('StylesheetBom', array('criteria'=>array(
					'condition'=>"ss_id={$model->ss_id}",
			)));
			
			$bomItems = array();
			foreach ($ssBomItemsDataProvider->getData() as $i => $ssBomItem) {
				$bomItems[$ssBomItem['ss_bom_id']]= new CActiveDataProvider('Bom', (array('criteria'=>array(
						'condition'=>"ss_id='{$ssBomItem->ss_bom_id}'"))));
			}
				
			$this->render('view',array(
				'model'=>$model,
				'ss_model' => $ss_model,
				'sizes' => $sizes,
				'ssBomItemsDataProvider'=>$ssBomItemsDataProvider,
				'bomItems'=> $bomItems
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($ss_id)
	{
		if ($this->can('create')) {
			$model=new Bomsheet;
			$ss_model = Stylesheet::model()->findByAttributes(array('ss_id'=>$ss_id));
			$model->ss_id = $ss_id;
			$model->user_id = Yii::app()->user->id;
			$model->pono = $ss_model->pono; 
			
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Bomsheet']))
			{
				$model->attributes=$_POST['Bomsheet'];
				if($model->save()) {
					// Save the pono also to the stylesheet
					if ($ss_model->pono == '') {
						$ss_model->pono = $model->pono;
						$ss_model->save();
					}
					
					// Initialize stylesheet sizes quantities
					if ($ss_model->initStylesheetSizeQuantities($model->bs_id))
						$this->redirect(array('view','id'=>$model->bs_id));
				}
			}
	
			$this->render('create',array(
				'model'=>$model,
				'ss_model' => $ss_model
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
	public function actionUpdate($id, $ss_id)
	{
		$model=$this->loadModel($id);
		if ($this->can('update', $model)) {
			$ss_model = Stylesheet::model()->findByAttributes(array('ss_id'=>$ss_id));
			
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Bomsheet']))
			{
				$model->attributes=$_POST['Bomsheet'];
				$model->logComment = "Updated pono";
				if($model->save()) {
					// Save the pono also to the stylesheet
					$ss_model->pono = $model->pono;
					$ss_model->save();
						
					$this->redirect(array('view','id'=>$model->bs_id));
				}
			}
	
			$this->render('update',array(
				'model'=>$model,
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
	public function actionDelete($id)
	{
		$model=$this->loadModel($id);
		if ($this->can('delete', $model)) {
		
			$ss_id = $model->ss_id;
			$model->delete();
			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(array('stylesheet/view', 'id'=>$ss_id));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex($ss_id)
	{
		if ($this->can('view')) {
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			$model = Bomsheet::model()->findByAttributes(array('ss_id'=>$ss_id));
			
			if ($model !== NULL) 
				$this->redirect(array('view','id'=>$model->bs_id));
			else 
				$this->render('index',array(
						'ss_model'=>$ss_model
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
			$model=new Bomsheet('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Bomsheet']))
				$model->attributes=$_GET['Bomsheet'];
	
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
	 * @return Bomsheet the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Bomsheet::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Bomsheet $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='bomsheet-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function actionGetLogEntries ($bs_id) {
		if ($this->can('view')) {
			$logsDataProvider=new CActiveDataProvider('BomLog',
					array(
							'criteria'=>array('condition'=>"bs_id={$bs_id}")));
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
	
	public function actionAddNote ($bs_id, $ss_id) {
		$bs_model = $this->loadModel($bs_id);
		if ($this->can('update', $bs_model)) {
			$model = new BomLog();
			$model->action_type = 'Update';
			$model->bs_id = $bs_id; // Mother stylesheet id
			$model->user = Yii::app()->user->id;
			
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			
			$this->performAjaxValidation($model);
	
			if(isset($_POST['BomLog']))
			{
				$model->attributes=$_POST['BomLog'];
				if($model->save()) 	{
					Yii::app()->user->setFlash('success', "Note has been added, click the 'View Bom Log' link below to see it");
					$this->redirect(array('view','id'=>$bs_id));
				}
				
			}
	
			$this->render('addNote',array(
				'model'=>$model,
				'ss_model' => $ss_model,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	public function actionCreateExcel($bs_id) {
		if ($this->can('view')) {
			Yii::import('ext.phpexcel.XPHPExcel');
			$objPHPExcel= XPHPExcel::createPHPExcel();
			$objPHPExcel->getProperties()->setCreator(Yii::app()->user->name)
			->setLastModifiedBy(Yii::app()->user->name)
			->setTitle("BOM_$bs_id")
			->setSubject("BOM_$bs_id")
			->setDescription("BOM_$bs_id")
			->setKeywords("office 2007 openxml php")
			->setCategory("BOM_$bs_id");
	
			// fill cell headers
			$ex_cellHeader= array();
			$cellHeader = array();
			$model = new Bom();
				
			// Bom attributes
			$attributes = array (
					'itemno',
					'itemColor',
					'item_desc',
					'itemCode',
					'itemSize',
					'item_qty',
					'item_consumption',
					'itemRequired',
					'item_increase',
					'item_placement',
					'price',
					'cost'
			);
				
			$letter = 'A';
			foreach ($attributes as $att) {
				$der_att = $model->attributeLabels();
				$cellHeader[$att] = $der_att[$att];
				$ex_cellHeader[$att] = $letter++;
	
				// Fill in header values
				$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue("{$ex_cellHeader[$att]}1", "{$cellHeader[$att]}");
			}
				
			// Get all bom items (BOM sheet)
			$bomItems= Bom::model()->findAllByAttributes(array('bs_id'=>$bs_id));
			
				
			// Fill in data
			$row = 2;
			foreach ($bomItems as $model) {
					// Fill bom data
					foreach ($attributes as $att) {
						$objPHPExcel->setActiveSheetIndex(0)->setCellValue("{$ex_cellHeader[$att]}$row", "{$model[$att]}");
					}
					$row++;
			}
	
			// Rename worksheet
			$objPHPExcel->getActiveSheet()->setTitle("BOM_$bs_id");
				
			// Set active sheet index to the first sheet, so Excel opens this as the first sheet
			$objPHPExcel->setActiveSheetIndex(0);
			date_default_timezone_set('UTC');
			$date = new DateTime();
			
			// Redirect output to a clientâ€™s web browser (Excel5)
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="BOM_'.$bs_id.'_'.$date->getTimestamp().'.xls"');
			header('Cache-Control: max-age=0');
			// If you're serving to IE 9, then the following may be needed
			header('Cache-Control: max-age=1');
	
			// If you're serving to IE over SSL, then the following may be needed
			header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
			header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
			header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
			header ('Pragma: public'); // HTTP/1.0
	
			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
			$objWriter->save('php://output');
			Yii::app()->end();
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionExportToPDF($bs_id, $ss_id) {
	
		if ($this->can('view')) {
			
			$model = $this->loadModel($bs_id);
			$bomItems = Bom::model()->findAllByAttributes(array('bs_id'=>$bs_id));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			$html2pdf = Yii::app()->ePdf->mPDF('','', 10, 'Tahoma', 7, 7, 7, 7, 0, 0, 'L');
				
			$html2pdf->WriteHTML($this->renderPartial('bomPrintView', array(
					'bomItems'=>$bomItems,
					'model' => $model,
					'ss_model'=>$ss_model,
			), true));
			$html2pdf->Output();
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}


	public function actionModifySizeQty ($bs_id, $ss_id) {
		
		$bs_model = Bomsheet::model()->findByPk($bs_id);
		if ($this->can('update', $bs_model)) {
			$ss_size_qty = SsSizeQty::model()->findAllByAttributes(array('bs_id'=>$bs_id));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			
			if(isset($_POST['SsSizeQty']))
			{
				$allSaved = true;
				foreach ($ss_size_qty as $i=>$s_model) {
					$s_model->size_qty = $_POST['SsSizeQty'][$i]["size_qty"];
					
					if (!$s_model->save())
						$allSaved = false;
				}
	
				if ($allSaved) {
					// Save a log entry 
					
					$bs_model->logComment = "modifying sizes";
					$bs_model->save();
					$this->redirect(array('view','id'=>$bs_id));
				}
			}
				
			$this->render('modifySizes',array(
					'ss_model' => $ss_model,
					'model'=> $ss_size_qty,
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function can ($resp, $model=NULL) {
		return (Yii::app()->authManager->checkAccess("{$resp}BOM", Yii::app()->user->id)||
		(
				$model !== NULL &&
		 		($resp=='update' || $resp== 'delete') && 
				Yii::app()->authManager->checkAccess("{$resp}OwnBOM", Yii::app()->user->id)&& 
				Yii::app()->user->id == $model->user_id));
	}
}
