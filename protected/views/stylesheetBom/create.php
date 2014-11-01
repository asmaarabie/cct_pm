<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Boms Items'=>array('index', 'ss_id'=>$ss_model->ss_id),
	'Create',
);

?>

<h1>Create StylesheetBom</h1>

<?php //$this->renderPartial('_form', array('model'=>$model, 'cc_model'=> $cc_model)); ?>
<?php $this->renderPartial('_updateForm', array('model'=>$model, 'cc_model'=> $cc_model)); ?>