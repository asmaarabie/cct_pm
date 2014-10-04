<?php
/* @var $this PrivilegesController */
/* @var $model Privileges */

$this->breadcrumbs=array(
	'Privileges'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Privileges', 'url'=>array('index')),
	array('label'=>'Manage Privileges', 'url'=>array('admin')),
);
?>

<h1>Create Privileges</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>