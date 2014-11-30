<?php
/* @var $this DepartmentNameController */
/* @var $model DepartmentName */

$this->breadcrumbs=array(
	'Department Names'=>array('index'),
	$model->dept_name=>array('view','id'=>$model->dept_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List DepartmentName', 'url'=>array('index')),
	array('label'=>'Create DepartmentName', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View DepartmentName', 'url'=>array('view', 'id'=>$model->dept_id)),
	array('label'=>'Manage DepartmentName', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update DepartmentName <?php echo $model->dept_name; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>