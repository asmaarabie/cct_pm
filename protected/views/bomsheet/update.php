<?php
/* @var $this BomsheetController */
/* @var $model Bomsheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	$model->bs_id=>array('view','id'=>$model->bs_id),
	'Update',
);
?>

<h1>Update BOMsheet <?php echo $model->bs_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>