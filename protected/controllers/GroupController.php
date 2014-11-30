<?php

class GroupController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';
	
	// List the possible permissions:
	// N.B. Copy is the same as create, and export any view into excel or PDF is the same as view; no need to add extra permissions for them
	// N.B. Who has the CRUD permissions has the 'admin' permission
	// N.B. the order of these permissions is crucial, ;this is the order of checking in the user identity, for user permissions
	protected $permissions = array('view', 'create', 'update', 'delete', 'admin', 'updateOwn', 'deleteOwn' );
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
				'users'=>array('@'),
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
			$_POST['returnUrl'] = array ('view', 'id'=>$id);
			
			$usersDataProvider=new CActiveDataProvider('User', 
				array(
					'criteria'=>array('condition'=>"user_group={$id}")));
			
			// Get all group operations
			$operations = GroupOperations::model()-> findAllByAttributes (array('group_id'=>$id));
			$rawData = array();
			foreach ($operations as $op) {
				$row['id'] = $op->responsibility;
				foreach ($this->permissions as $i=> $perm)
					$row[$perm] = substr($op->permissions, $i, 1);
				$rawData[] = $row;
			}
			
			$dataProvider=new CArrayDataProvider($rawData, array(
					'id'=>'id',
			));
			$this->render('view',array(
				'model'=>$this->loadModel($id),
				'operations' => $dataProvider,
				'usersDataProvider' => $usersDataProvider,
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
		if ($this->can('create')) {
			$model=new Group;
			
			// Get all possible operations
			$rawData = array();
			$operations = Operation::model()->findAll();
			foreach ($operations as $op) {
				$row['id'] = $op->op_name;
				foreach ($this->permissions as $i=> $perm)
					$row[$perm] = 0;
				$rawData[] = $row;
			}
		
			$dataProvider=new CArrayDataProvider($rawData, array(
					'id'=>'id',
			));
			
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
	
			if(isset($_POST['Group']))
			{
				$model->attributes=$_POST['Group'];
				
				// Save the group model
				if($model->save()) {
					$hasOperation = 0;
					// Adding permission models to this group
					foreach ($operations as $op) {
						$group_operation = new GroupOperations();
						$group_operation->group_id = $model->group_id;
						$group_operation->responsibility = $op->op_name;
						
						// Permissions are either 0 => not allowed, 1 => allowed, to be bitwise anded when necessary
						$permission_string = str_pad('', 10, "0", STR_PAD_BOTH);
						foreach ($this->permissions as $i=>$perm) {
							if (isset($_POST["{$perm}"]) && (array_search("{$op->op_name}", $_POST["{$perm}"])) !== false)
								$permission_string= substr_replace($permission_string,1,$i,1);	
						}
						$group_operation->permissions = $permission_string;
						if ($group_operation->save()) 
							$hasOperation++;
					}
				
				
					if ($hasOperation>0) {
						Yii::app()->user->setFlash("success", "If you're in the group of $model->group_name, logout then login to apply the changes to your account");
						$this->redirect(array('view','id'=>$model->group_id));
					}
					else {
						Yii::app()->user->setFlash("error", "You have to specify at least one group operation");
						$this->redirect(array('update','id'=>$model->group_id));
					}
				}
			}
	
			$this->render('create',array(
				'model'=>$model,
				'operations' => $dataProvider,
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
		if ($this->can('update')) {
			$model=$this->loadModel($id);
			
			// Get all group operations
			$rawData = array();
			$operations = GroupOperations::model()-> findAllByAttributes (array('group_id'=>$id));
			foreach ($operations as $op) {
				$row['id'] = $op->responsibility;
				foreach ($this->permissions as $i=> $perm)
					$row[$perm] = substr($op->permissions, $i, 1);
				$rawData[] = $row;
			}
			
			$dataProvider=new CArrayDataProvider($rawData, array(
					'id'=>'id',
			));
			
			// Uncomment the following line if AJAX validation is needed
			$this->performAjaxValidation($model);
			if(isset($_POST['Group']))
			{
				$model->attributes=$_POST['Group'];
				if($model->save()) {
					$hasOperation = 0;
					// Adding permission models to this group
					foreach ($operations as $op) {
						
						// Permissions are either 0 => not allowed, 1 => allowed, to be bitwise anded when necessary
						$permission_string = str_pad('', 10, "0", STR_PAD_BOTH);
						foreach ($this->permissions as $i=>$perm) {
							if (isset($_POST["{$perm}"]) && (array_search("{$op->responsibility}", $_POST["{$perm}"])) !== false)
								$permission_string= substr_replace($permission_string,1,$i,1);
							else 
								$permission_string= substr_replace($permission_string,0,$i,1);
						}
						$op->permissions = $permission_string;
						if ($op->save()) 
							$hasOperation++;
					}
				
					if ($hasOperation>0) {
						Yii::app()->user->setFlash("success", "If you're in the group of $model->group_name, logout then login to apply the changes to your account");
						$this->redirect(array('view','id'=>$model->group_id));
					}
					else {
						Yii::app()->user->setFlash("error", "You have to specify at least one group operation");
						$this->redirect(array('update','id'=>$model->group_id));
					}
				}
			}
	
			$this->render('update',array(
				'model'=>$model,
				'operations' => $dataProvider
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
		if ($this->can('delete')) {
		
			if (!$this->loadModel($id)->delete()) 
				$this->redirect(array('view', 'id'=> $id));
			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			elseif(!isset($_GET['ajax']))
				$this->redirect(array('index'));
		} else {
			throw new CHttpException(403,'You are not authorized to perform this action.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		if ($this->can('view')) {
			$dataProvider=new CActiveDataProvider('Group');
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
		if ($this->can('admin')) {
			$model=new Group('search');
			$model->unsetAttributes();  // clear any default values
			if(isset($_GET['Group']))
				$model->attributes=$_GET['Group'];
	
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
	public function can ($resp) {
		return (Yii::app()->authManager->checkAccess("{$resp}Groups", Yii::app()->user->id));
	}
}
