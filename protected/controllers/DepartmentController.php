<?php

class DepartmentController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
	public function actionGetDCSAjax(){
		$param = $_GET['param'];
		$request=trim($_GET['term']);
		if($request!=''){
			$data = Yii::app()->db->createCommand()
			->selectDistinct("{$param}")
			->from('departments')
			->where(array('like', "{$param}", "$request%"))
			->queryAll();
	
			$return_array = array();
			foreach($data as $sub) {
				$return_array[] = array(
						'label'=>$sub["{$param}"],
						'value'=>$sub["{$param}"],
						'id'=>$sub["{$param}"],
				);
			}
	
			$this->layout='empty';
			echo json_encode($return_array);
	
		}
	
	}
	
	
}