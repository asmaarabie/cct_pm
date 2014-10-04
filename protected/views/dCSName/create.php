<?php
/* @var $this DCSNameController */
/* @var $model DCSName */

$this->breadcrumbs=array(
	'DCS Names'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List DCSName', 'url'=>array('index')),
	array('label'=>'Manage DCSName', 'url'=>array('admin')),
);
?>

<h1>Create DCS Name</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>