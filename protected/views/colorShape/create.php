<?php
/* @var $this ColorShapeController */
/* @var $model ColorShape */

$this->breadcrumbs=array(
	'Pattern Shapes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Pattern Shape', 'url'=>array('index')),
	array('label'=>'Manage Pattern Shape', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Create Pattern Shape</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>