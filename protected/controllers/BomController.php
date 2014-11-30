<?php

class BomController extends Controller
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
				'actions'=>array('getItemInfo'),
				'users'=>array('@'),
			),
				/*
			array('allow',  // allow all users to perform 'index' and 'view' actions
					'actions'=>array('index','view'),
					'users'=>array('*'),
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
		
		if (Yii::app()->authManager->checkAccess('viewBOM', Yii::app()->user->id)) {
			$this->render('view',array(
				'model'=>$this->loadModel($id),
			));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
	
	public function actionPopulate($ss_id) {
		$ss_bom = StylesheetBom::model()->findByAttributes(array(''));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($ss_bom_id)
	{
		if (Yii::app()->authManager->checkAccess('createBOM', Yii::app()->user->id)) {
			$model=new Bom;
			
			$ss_bom_model= StylesheetBom::model()->findByPk($ss_bom_id);
			$ss_model = Stylesheet::model()->findByPk($ss_bom_model->ss_id);
			
			$model->item_consumption = $ss_bom_model->item_cons;
			$model->item_desc = $ss_bom_model->item_desc;
			$model->item_placement = $ss_bom_model->item_placement;
			$model->pono = $ss_model->pono;
			$model->ss_id = $ss_bom_id;
			$model->countryid = $ss_bom_model->countryid;
			$model->fulldept = $ss_bom_model->fulldept;
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Bom']))
			{
				$model->attributes=$_POST['Bom'];
				
				if($model->save()) {
					if ($ss_model->pono == '') {
						$ss_model->pono = $model->pono;
						$ss_model->save();
					}
					$this->redirect(array('index','ss_id'=>$ss_model->ss_id));
				}
			}
	
			$this->render('create',array(
				'model'=>$model,
				'ss_model' => $ss_model,
				'ss_bom_model' => $ss_bom_model,
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
		if (Yii::app()->authManager->checkAccess('updateBOM', Yii::app()->user->id)) {
			$model=$this->loadModel($id);
			$model->log_entry = new StylesheetLog();
			
			$ss_bom_model= StylesheetBom::model()->findByPk($model->ss_id);
			$ss_model = Stylesheet::model()->findByPk($ss_bom_model->ss_id);
			
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model, $model->log_entry);
	
			if(isset($_POST['Bom'], $_POST['StylesheetLog']))
			{
				$model->attributes=$_POST['Bom'];
				$model->log_entry->attributes = $_POST['StylesheetLog'];
				if($model->save() && $model->log_entry->save()) 
					$this->redirect(array('index','ss_id'=>$ss_model->ss_id));
			}
	
			$this->render('update',array(
				'model'=>$model,
				'ss_bom_model' => $ss_bom_model,
				'ss_model' => $ss_model,
				'log' => $model->log_entry
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
		if (Yii::app()->authManager->checkAccess('deleteBOM', Yii::app()->user->id)) {
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
	public function actionIndex($ss_id)
	{
		if (Yii::app()->authManager->checkAccess('viewBOM', Yii::app()->user->id)) {
			$ssBomItems = StylesheetBom::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			$ssBomItemsDataProvider=new CActiveDataProvider('StylesheetBom', array('criteria'=>array(
					'condition'=>"ss_id={$ss_id}",
			)));
	
			$bomItems = array();
			
			foreach ($ssBomItems as $i => $ssBomItem) {
				$bomItems[$ssBomItem['ss_bom_id']]= new CActiveDataProvider('Bom', (array('criteria'=>array(
					'condition'=>"ss_id='{$ssBomItem->ss_bom_id}'"))));
			}
			
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			if($ss_model===null)
				throw new CHttpException(404,'The requested stylesheet page does not exist.');
			
			$this->render('index',array(
				'ss_model' => $ss_model,
				'ssBomItems' => $ssBomItems,
				'ssBomItemsDataProvider' => $ssBomItemsDataProvider,
				'bomItems'=>$bomItems,
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
		if (Yii::app()->authManager->checkAccess('adminBOM', Yii::app()->user->id)) {
			$model=new Bom('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Bom']))
				$model->attributes=$_GET['Bom'];
	
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
	 * @return Bom the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Bom::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Bom $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='bom-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	

	public function actionModifySizeQty ($ss_id) {
		if (Yii::app()->authManager->checkAccess('updateBOM', Yii::app()->user->id)) {
			$ss_size_qty = SsSizeQty::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			
			// if the quantity is zero, auto fill, then display the form
			if (count($ss_size_qty) == 0) {
				
				$sizes = Size::model()->getScaleSizes($ss_model->scale);
				$model_sizes = $ss_model->sizes;
				
				foreach ($sizes as $i=>$size) {
					if (substr($model_sizes,$i,1)=="1") {
						$s_model = new SsSizeQty();
						$s_model->ss_id = $ss_id;
						$s_model->size = $size;
						$s_model->size_qty = 0;
						$s_model->save();	
					}
				}
				
				$ss_size_qty = SsSizeQty::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			}
			
			if(isset($_POST['SsSizeQty']))
			{
				$allSaved = true;
				foreach ($ss_size_qty as $i=>$s_model) {
					$s_model->size_qty = $_POST['SsSizeQty'][$i]["size_qty"];
					if (!$s_model->save()) 
						$allSaved = false;
				}
				
				if ($allSaved) {
					$this->redirect(array('index','ss_id'=>$ss_id));
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
	
	public function actionGetItemInfo () {
		//var_dump();
		$itemno =$_POST['Bom']['itemno'];
		if ($itemno!='') {
			$item_model = Items::model()->findByAttributes(array('itemno'=> $itemno, 'countryid'=> 1)); // countryid =1 is fixed for bom
			
			// :TODO: when the arabic item description is ready replace the the 2nd td with the following line
			// <td> {$item_model->desc1} - {$item_model->desc2} </td>
			echo "
			<table>
				<tr>
					<th> Color </th>
					<th> Code </th>
					<th> Size </th>
					<th> Cost </th>
					<th> Price </th>
				</tr>
				<tr>
					<td> {$item_model->itemattr} </td>
					<td> {$item_model->desc1} </td>
					<td> {$item_model->itemsize} </td>
					<td> {$item_model->unitcost} </td>
					<td> {$item_model->unitprice} </td>
				</tr>
			</table>
			";
		}
	}
	
	public function actionGetLogEntries ($ss_id) {
		if (Yii::app()->authManager->checkAccess('viewBOM', Yii::app()->user->id)) {
			$logsDataProvider=new CActiveDataProvider('StylesheetLog',
					array(
							'criteria'=>array('condition'=>"ss_id={$ss_id} and action_type='bom'")));
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
	
	public function actionAddNote ($ss_id) {
		if (Yii::app()->authManager->checkAccess('updateBOM', Yii::app()->user->id)) {
			$model = new StylesheetLog();
			$model->action_type = 'bom';
			$model->ss_id = $ss_id; // Mother stylesheet id
			$model->user = Yii::app()->user->id;
			
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			
			$this->performAjaxValidation($model);
	
			if(isset($_POST['StylesheetLog']))
			{
				$model->attributes=$_POST['StylesheetLog'];
				if($model->save()) 	{
					Yii::app()->user->setFlash('success', "Note has been added, click the 'View Bom Log' link below to see it");
					$this->redirect(array('index','ss_id'=>$ss_id));
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
	
	public function actionCreateExcel($ss_id) {
		if (Yii::app()->authManager->checkAccess('viewBOM', Yii::app()->user->id)) {
			Yii::import('ext.phpexcel.XPHPExcel');
			$objPHPExcel= XPHPExcel::createPHPExcel();
			$objPHPExcel->getProperties()->setCreator(Yii::app()->user->name)
			->setLastModifiedBy(Yii::app()->user->name)
			->setTitle("Stylesheet_$ss_id\_BOM")
			->setSubject("Stylesheet_$ss_id\_BOM")
			->setDescription("Stylesheet_$ss_id\_BOM")
			->setKeywords("office 2007 openxml php")
			->setCategory("Stylesheet_$ss_id\_BOM");
		
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
				$cellHeader[$att] = $model->attributeLabels()[$att];
				$ex_cellHeader[$att] = $letter++;
				
				// Fill in header values
				$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue("{$ex_cellHeader[$att]}1", "{$cellHeader[$att]}");
			}
			
			// Get this stylsheet's design bom items (Style sheet)
			$ssBomItems = StylesheetBom::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			
			// For each design bom item, get all bom items (BOM sheet)
			$bomItems = array();
			foreach ($ssBomItems as $model) {
				$bomItems[] = Bom::model()->findAllByAttributes(array('ss_id'=>$model->ss_bom_id));
			}
			
			// Fill in data 
			$row = 2;
			foreach ($bomItems as $models) {
				foreach ($models as $model) {
					// Fill bom data
					foreach ($attributes as $att) {
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue("{$ex_cellHeader[$att]}$row", "{$model[$att]}");
					}
					$row++;
				}
			}
		
			// Rename worksheet
			$objPHPExcel->getActiveSheet()->setTitle('Stylesheet_'.$ss_id.'_BOM');
			
			// Set active sheet index to the first sheet, so Excel opens this as the first sheet
			$objPHPExcel->setActiveSheetIndex(0);
		
			$date = new DateTime();
			
			// Redirect output to a clientâ€™s web browser (Excel5)
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="Stylesheet_'.$ss_id.'_BOM_'.$date->getTimestamp().'.xls"');
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
	
	public function actionExportToPDF($ss_id) {
		
		if (Yii::app()->authManager->checkAccess('viewBOM', Yii::app()->user->id)) {
			// Get this stylsheet's design bom items (Style sheet)
			$ssBomItems = StylesheetBom::model()->findAllByAttributes(array('ss_id'=>$ss_id));
			$ss_model = Stylesheet::model()->findByPk($ss_id);
			
			// For each design bom item, get all bom items (BOM sheet)
			$bomItems = array();
			foreach ($ssBomItems as $model) {
				$bomItems[] = Bom::model()->findAllByAttributes(array('ss_id'=>$model->ss_bom_id));
			}
			
			$html2pdf = Yii::app()->ePdf->mPDF('','', 10, 'Tahoma', 7, 7, 7, 7, 0, 0, 'L');
			
			$html2pdf->WriteHTML($this->renderPartial('bomPrintView', array(
					'bomItems'=>$bomItems,
					'model' => $ss_model
			), true));
			$html2pdf->Output();
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}
}
