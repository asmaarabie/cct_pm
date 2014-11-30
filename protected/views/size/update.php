<?php
/* @var $this SizeController */
/* @var $model Size */

$this->breadcrumbs=array(
	'Sizes'=>array('index'),
	$model->scale_number=>array('view','id'=>$model->scale_number),
	'Update',
);

$this->menu=array(
	array('label'=>'List Size', 'url'=>array('index')),
	array('label'=>'Create Size', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View Size', 'url'=>array('view', 'id'=>$model->scale_number)),
	array('label'=>'Manage Size', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update Size <?php echo $model->scale_number; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>