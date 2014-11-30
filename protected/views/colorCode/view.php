<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	$model->color_code,
);

$this->menu=array(
	array('label'=>'List Color Code', 'url'=>array('index')),
	array('label'=>'Create Color Code', 'url'=>array('create'), 'visible'=> $this->can('create')),
	//array('label'=>'Update Color Code', 'url'=>array('update', 'id'=>$model->color_code), 'visible'=> $this->can('update')),
	array('label'=>'Delete Color Code', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_code),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage Color Code', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View Color Code #<?php echo $model->color_code; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(

		'color_code',
		'color',
		'shadow',
		'shape',
		'pattern',
		// 'length',
		'color_serial',
	),
)); ?>
