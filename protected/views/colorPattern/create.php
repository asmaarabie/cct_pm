<?php
/* @var $this ColorPatternController */
/* @var $model ColorPattern */

$this->breadcrumbs=array(
	'Color Patterns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Color Pattern', 'url'=>array('index')),
	array('label'=>'Manage Color Pattern', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Create Color Pattern</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>