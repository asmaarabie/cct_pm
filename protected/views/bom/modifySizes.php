<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom' => array('index', 'ss_id'=>$ss_model->ss_id),
	'Modify Sizes'
);

?>

<h1>Modify Sizes</h1>

<?php $this->renderPartial('_sizesForm', array('model'=>$model)); ?>