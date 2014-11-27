<?php
/* @var $this DepartmentNameController */
/* @var $model DepartmentName */

$this->breadcrumbs=array(
	'Department Names'=>array('index'),
	$model->dept_name,
);

$this->menu=array(
	array('label'=>'List DepartmentName', 'url'=>array('index')),
	array('label'=>'Create DepartmentName', 'url'=>array('create')),
	array('label'=>'Update DepartmentName', 'url'=>array('update', 'id'=>$model->dept_id)),
	array('label'=>'Delete DepartmentName', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->dept_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage DepartmentName', 'url'=>array('admin')),
);
?>

<h1>View DepartmentName #<?php echo $model->dept_name; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'dept_id',
		'dept_name',
		'countryid'
	),
)); ?>
