<?php
/* @var $this StylesheetLogController */
/* @var $model StylesheetLog */

$this->breadcrumbs=array(
	'Stylesheet Logs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List StylesheetLog', 'url'=>array('index')),
	array('label'=>'Manage StylesheetLog', 'url'=>array('admin')),
);
?>

<h1>Create StylesheetLog</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>