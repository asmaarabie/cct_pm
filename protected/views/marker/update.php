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
	array('label'=>'Delete Marker', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->marker_id),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete', $model)),
	array('label'=>'Copy Marker', 'url'=>array('copy', 'id'=>$model->marker_id), 'visible'=> $this->can('create')),
	array('label'=>'Create Marker', 'url'=>array('create', 'ss_id'=>$model->ss_id), 'visible'=> $this->can('create')),
);
?>

<h1>Update Marker <?php echo $model->marker_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'log'=>$log)); ?>