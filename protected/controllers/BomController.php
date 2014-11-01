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
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update', 'modifySizeQty', 'getItemInfo', 'delete', 'getLogEntries'),
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
	
	public function actionPopulate($ss_id) {
		$ss_bom = StylesheetBom::model()->findByAttributes(array(''));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($ss_bom_id)
	{
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
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
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
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Bom('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Bom']))
			$model->attributes=$_GET['Bom'];

		$this->render('admin',array(
			'model'=>$model,
		));
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
	}
	
	public function actionGetItemInfo () {
		//var_dump();
		$itemno =$_POST['Bom']['itemno'];
		if ($itemno!='') {
			$item_model = Items::model()->findByAttributes(array('itemno'=> $itemno));
		
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
					<td> {$item_model->desc1} - {$item_model->desc2} </td>
					<td> {$item_model->itemsize} </td>
					<td> {$item_model->unitcost} </td>
					<td> {$item_model->unitprice} </td>
				</tr>
			</table>
			";
		}
	}
	
	public function actionGetLogEntries ($ss_id) {
		$logsDataProvider=new CActiveDataProvider('StylesheetLog',
				array(
						'criteria'=>array('condition'=>"ss_id={$ss_id} and action_type='bom'")));
		if (Yii::app()->request->isAjaxRequest) {
			$done =$this->renderPartial('viewLog', array('logsDataProvider' =>
					$logsDataProvider), false, true);
			echo $done;
			Yii::app()->end();
		}
	}
}
