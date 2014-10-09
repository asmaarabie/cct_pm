<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List ColorCode', 'url'=>array('index')),
	array('label'=>'Manage ColorCode', 'url'=>array('admin')),
);
?>

<h1>Create ColorCode</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>