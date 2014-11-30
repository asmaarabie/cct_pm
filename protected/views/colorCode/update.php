<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	$model->color_code=>array('view','id'=>$model->color_code),
	'Update',
);

$this->menu=array(
	array('label'=>'List Color Code', 'url'=>array('index')),
	array('label'=>'Create Color Code', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View Color Code', 'url'=>array('view', 'id'=>$model->color_code)),
	array('label'=>'Manage Color Code', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update Color Code <?php echo $model->color_code; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>