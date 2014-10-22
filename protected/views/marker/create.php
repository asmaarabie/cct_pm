<?php
/* @var $this MarkerController */
/* @var $model Marker */

$this->breadcrumbs=array(
	'Markers'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Marker', 'url'=>array('index')),
	array('label'=>'Manage Marker', 'url'=>array('admin')),
);
?>

<h1>Create Marker</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>