<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom'=>array('index', 'ss_id'=>$ss_model->ss_id),
	'item #' . $model->bom_id=>array('view','id'=>$model->bom_id),
	'Update',
);
?>

<h1>Update Bom <?php echo $model->bom_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'log'=>$log)); ?>