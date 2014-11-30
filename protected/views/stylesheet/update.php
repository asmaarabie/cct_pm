<?php
/* @var $this StylesheetController */
/* @var $model Stylesheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('index'),
	$model->ss_id=>array('view','id'=>$model->ss_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Stylesheet', 'url'=>array('index')),
	array('label'=>'Create Stylesheet', 'url'=>array('create'), 'visible'=> $this->can('create', $model)),
	array('label'=>'View Stylesheet', 'url'=>array('view', 'id'=>$model->ss_id)),
	array('label'=>'Manage Stylesheet', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update Stylesheet <?php echo $model->ss_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model,'scales'=>$scales, 'log'=>$log)); ?>