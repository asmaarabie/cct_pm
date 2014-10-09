<?php
/* @var $this ColorLengthController */
/* @var $model ColorLength */

$this->breadcrumbs=array(
	'Color Lengths'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Color Length', 'url'=>array('index')),
	array('label'=>'Manage Color Length', 'url'=>array('admin')),
);
?>

<h1>Create Color Length</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>