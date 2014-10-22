<?php
/* @var $this GroupOperationsController */
/* @var $model GroupOperations */

$this->breadcrumbs=array(
	'Group Operations'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List GroupOperations', 'url'=>array('index')),
	array('label'=>'Manage GroupOperations', 'url'=>array('admin')),
);
?>

<h1>Create GroupOperations</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>