<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom'=>array('index', 'ss_id'=>$ss_model->ss_id),
	"{$ss_bom_model->code}" => array ('stylesheetBom/view', 'id'=> $ss_bom_model->ss_bom_id),
	'Add bom item',
);

$this->menu=array(
	array('label'=>'List Bom', 'url'=>array('index')),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Add Bom Item</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>