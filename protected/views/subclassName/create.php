<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */

$this->breadcrumbs=array(
	'Subclass Names'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List SubclassName', 'url'=>array('index')),
	array('label'=>'Manage SubclassName', 'url'=>array('admin')),
);
?>

<h1>Create Subclass Name</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>