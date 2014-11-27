<?php
/* @var $this MarkerController */
/* @var $model Marker */

$this->breadcrumbs=array(
	'Markers'=>array('index'),
	'Create',
);

?>

<h1>Create Marker</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>