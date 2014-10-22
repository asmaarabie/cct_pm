<?php
/* @var $this OperationController */
/* @var $model Operation */

$this->breadcrumbs=array(
	'Operations'=>array('index'),
	$model->op_name=>array('view','id'=>$model->op_name),
	'Update',
);

$this->menu=array(
	array('label'=>'List Operation', 'url'=>array('index')),
	array('label'=>'Create Operation', 'url'=>array('create')),
	array('label'=>'View Operation', 'url'=>array('view', 'id'=>$model->op_name)),
	array('label'=>'Manage Operation', 'url'=>array('admin')),
);
?>

<h1>Update Operation <?php echo $model->op_name; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>