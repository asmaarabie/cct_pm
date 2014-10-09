<?php
/* @var $this ColorShadowController */
/* @var $model ColorShadow */

$this->breadcrumbs=array(
	'Color Shadows'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Color Shadow', 'url'=>array('index')),
	array('label'=>'Manage Color Shadow', 'url'=>array('admin')),
);
?>

<h1>Create Color Shadow</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>