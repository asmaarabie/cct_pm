<?php
/* @var $this OperationController */
/* @var $model Operation */

$this->breadcrumbs=array(
	'Operations'=>array('index'),
	$model->op_name,
);

$this->menu=array(
	array('label'=>'List Operation', 'url'=>array('index')),
	array('label'=>'Create Operation', 'url'=>array('create')),
	array('label'=>'Update Operation', 'url'=>array('update', 'id'=>$model->op_name)),
	array('label'=>'Delete Operation', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->op_name),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Operation', 'url'=>array('admin')),
);
?>

<h1>View Operation #<?php echo $model->op_name; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'op_name',
		'operation',
	),
)); ?>
