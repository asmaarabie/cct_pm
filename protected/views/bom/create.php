<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom'=>array('index', 'ss_id'=>$ss_model->ss_id),
	'Add bom item under '.$ss_bom_model->fulldept
);
?>
<h1>Add Bom Item</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>