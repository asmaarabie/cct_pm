<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Boms'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Bom', 'url'=>array('index')),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Create Bom</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>