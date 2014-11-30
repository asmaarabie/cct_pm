<?php
/* @var $this BomsheetController */
/* @var $model Bomsheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Create BOMsheet',
);

?>

<h1>Create BOMsheet</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>