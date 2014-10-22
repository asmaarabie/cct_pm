<?php

class GroupController extends Controller
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
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('@'),
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
		$_POST['returnUrl'] = array ('view', 'id'=>$id);
		#$users = User::model()->findAllByAttributes (array('group_id'=>$id));
		$usersDataProvider=new CActiveDataProvider('User', 
			array(
				'criteria'=>array('condition'=>"user_group={$id}")));
		
		$operations = GroupOperations::model()->findAllByAttributes (array('group_id'=>$id));
		$this->render('view',array(
			'model'=>$this->loadModel($id),
			'operations' => $operations,
			'usersDataProvider' => $usersDataProvider,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Group;
		
		// Get all possible operations
		$operations = Operation::model()->findAll();
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['Group']))
		{
			$model->attributes=$_POST['Group'];
			if($model->save()) {
				
				// if the group doesn't have any operations the user is redirected to the update to add some
				$hasOperation = false;
				
				// Foreach checkbox add a group operation 
				foreach ($operations as $operation) {
					$group_operation = new GroupOperations();
					$group_operation->group_id = $model->group_id;
					$group_operation->op_name = $operation->op_name;
					$group_operation->checked = 0;
					
					if (isset($_POST['box'.$operation->op_name])) {
						$group_operation->checked = 1;
						$hasOperation = true;
					} 
						
					$group_operation->save();
				}
				
				if ($hasOperation)
					$this->redirect(array('view','id'=>$model->group_id));
				else {
					Yii::app()->user->setFlash("group_operation", "You have to specify at least one group operation");
					$this->redirect(array('update','id'=>$model->group_id));
				}
			}
		}

		$this->render('create',array(
			'model'=>$model,
			'operations' => $operations,
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
		$operations = GroupOperations::model()-> findAllByAttributes (array('group_id'=>$id));
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['Group']))
		{
			$model->attributes=$_POST['Group'];
			$hasOperation = false;
			
			// Update checked value of the group operation
			foreach ($operations as $operation) {
					if (isset($_POST['box'.$operation->op_name])) {
						$operation->checked = 1;
						$hasOperation = true;
					}  else {
						$operation->checked = 0;
					}
					$operation->save();
				}
				
				if ($hasOperation)
					$this->redirect(array('view','id'=>$model->group_id));
				else {
					Yii::app()->user->setFlash("group_operation", "You have to specify at least one group operation");
				}
		}

		$this->render('update',array(
			'model'=>$model,
			'operations' => $operations
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		
		if (!$this->loadModel($id)->delete()) 
			$this->redirect(array('view', 'id'=> $id));
		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		elseif(!isset($_GET['ajax']))
			$this->redirect(array('index'));
		
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Group');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Group('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Group']))
			$model->attributes=$_GET['Group'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Group the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Group::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Group $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='group-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}
}
