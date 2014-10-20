<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheet Boms'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List StylesheetBom', 'url'=>array('index')),
	array('label'=>'Manage StylesheetBom', 'url'=>array('admin')),
);
?>

<h1>Create StylesheetBom</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>