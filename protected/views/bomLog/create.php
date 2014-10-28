<?php
/* @var $this BomLogController */
/* @var $model BomLog */

$this->breadcrumbs=array(
	'Bom Logs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List BomLog', 'url'=>array('index')),
	array('label'=>'Manage BomLog', 'url'=>array('admin')),
);
?>

<h1>Create BomLog</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>