<?php
/* @var $this ColorLengthController */
/* @var $model ColorLength */

$this->breadcrumbs=array(
	'Color Lengths'=>array('index'),
	$model->length_desc_e,
);

$this->menu=array(
	array('label'=>'List ColorLength', 'url'=>array('index')),
	array('label'=>'Create ColorLength', 'url'=>array('create')),
	array('label'=>'Update ColorLength', 'url'=>array('update', 'id'=>$model->color_length)),
	array('label'=>'Delete ColorLength', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_length),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ColorLength', 'url'=>array('admin')),
);
?>

<h1>View Color Length #<?php echo $model->length_desc_e; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'color_length',
		'length_desc_e',
		'length_desc_a',
	),
)); ?>
