<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Boms Items'=>array('index', 'ss_id'=>$ss_model->ss_id),
	'Update bom item '.$model->ss_bom_id,
);

?>

<h1>Update Stylesheet <?php echo $model->ss->style_code; ?> Bom item #<?php echo $model->ss_bom_id;?> </h1>

<?php $this->renderPartial('_updateForm', array('model'=>$model, 'cc_model'=> $cc_model)); ?>