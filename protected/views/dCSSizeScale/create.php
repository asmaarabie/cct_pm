<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */

$this->breadcrumbs=array(
	'DCS Size Scales'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List DCS Size Scale', 'url'=>array('index')),
	array('label'=>'Manage DCS Size Scale', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Create DCS Size Scale</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>