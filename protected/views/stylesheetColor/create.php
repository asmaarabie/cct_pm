<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_code =>array('stylesheet/view', "id"=> $ss_id),
	'Add Color',
);

?>

<h1>Add color</h1>
	
<?php $this->renderPartial('_form', array('model'=>$model, 'cc_model'=>$cc_model)); ?>
