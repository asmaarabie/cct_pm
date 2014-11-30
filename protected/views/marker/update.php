<?php
/* @var $this MarkerController */
/* @var $model Marker */

$this->breadcrumbs=array(
	'Markers'=>array('index', 'ss_id'=>$model->ss_id),
	$model->marker_id=>array('view','id'=>$model->marker_id),
	'Update',
);

$this->menu=array(
	array('label'=>'View Marker', 'url'=>array('view', 'id'=>$model->marker_id)),
);
?>

<h1>Update Marker <?php echo $model->marker_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'log'=>$log)); ?>