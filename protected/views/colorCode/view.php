<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	$model->color_code,
);

$this->menu=array(
	array('label'=>'List ColorCode', 'url'=>array('index')),
	array('label'=>'Create ColorCode', 'url'=>array('create')),
	array('label'=>'Update ColorCode', 'url'=>array('update', 'id'=>$model->color_code)),
	array('label'=>'Delete ColorCode', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_code),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ColorCode', 'url'=>array('admin')),
);
?>

<h1>View ColorCode #<?php echo $model->color_code; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'color',
		'shadow',
		'pattern',
		'length',
		'shape',
		'color_serial',
		'color_code',
	),
)); ?>
