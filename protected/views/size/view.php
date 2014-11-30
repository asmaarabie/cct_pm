<?php
/* @var $this SizeController */
/* @var $model Size */

$this->breadcrumbs=array(
	'Sizes'=>array('index'),
	$model->scale_number,
);

$this->menu=array(
	array('label'=>'List Size', 'url'=>array('index')),
	array('label'=>'Create Size', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update Size', 'url'=>array('update', 'id'=>$model->scale_number), 'visible'=> $this->can('update')),
	array('label'=>'Delete Size', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->scale_number),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage Size', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View Size #<?php echo $model->scale_number; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'scale_number',
		'scale_size',
		'scale_name',
	),
)); ?>
