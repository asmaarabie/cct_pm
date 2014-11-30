<?php
/* @var $this StylesheetImagesController */
/* @var $model StylesheetImages */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_model->style_code =>array('stylesheet/view', "id"=> $ss_model->ss_id),
	'Create',
);
/*
$this->menu=array(
	array('label'=>'List Stylesheet Images', 'url'=>array('index')),
	array('label'=>'Manage Stylesheet Images', 'url'=>array('admin')),
);
*/
?>

<h1>Upload Image for <?php echo CHtml::link($ss_model->style_code, array ('stylesheet/view', "id" => $ss_model->ss_id)) ?></h1> 
<?php $this->renderPartial('_form', array('model'=>$model)); ?>