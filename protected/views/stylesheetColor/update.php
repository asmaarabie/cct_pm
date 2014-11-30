<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_code =>array('stylesheet/view', "id"=> $ss_id),
	'Update ' . $model->color_code,
);

?>

<h1>Update <?php echo $ss_code; ?> 's color</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'cc_model'=> $cc_model)); ?>