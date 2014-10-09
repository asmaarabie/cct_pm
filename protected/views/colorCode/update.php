<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	$model->color_code=>array('view','id'=>$model->color_code),
	'Update',
);

$this->menu=array(
	array('label'=>'List ColorCode', 'url'=>array('index')),
	array('label'=>'Create ColorCode', 'url'=>array('create')),
	array('label'=>'View ColorCode', 'url'=>array('view', 'id'=>$model->color_code)),
	array('label'=>'Manage ColorCode', 'url'=>array('admin')),
);
?>

<h1>Update ColorCode <?php echo $model->color_code; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>