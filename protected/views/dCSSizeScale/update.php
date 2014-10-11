<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */

$this->breadcrumbs=array(
	'DCS Size Scales'=>array('index'),
	$model->DCS_size_id=>array('view','id'=>$model->DCS_size_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List DCSSizeScale', 'url'=>array('index')),
	array('label'=>'Create DCSSizeScale', 'url'=>array('create')),
	array('label'=>'View DCSSizeScale', 'url'=>array('view', 'id'=>$model->DCS_size_id)),
	array('label'=>'Manage DCSSizeScale', 'url'=>array('admin')),
);
?>

<h1>Update DCS Size Scale #<?php echo $model->size_scale.' for '.$model->size_fulldept; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>