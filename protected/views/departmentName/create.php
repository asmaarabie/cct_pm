<?php
/* @var $this DepartmentNameController */
/* @var $model DepartmentName */

$this->breadcrumbs=array(
	'Department Names'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List DepartmentName', 'url'=>array('index')),
	array('label'=>'Manage DepartmentName', 'url'=>array('admin')),
);
?>

<h1>Create DepartmentName</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>