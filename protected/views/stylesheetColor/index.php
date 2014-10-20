<?php
/* @var $this StylesheetColorController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_model->style_code =>array('stylesheet/view', "id"=> $ss_model->ss_id),
	'Colors',
);


$this->menu=array(
	array('label'=>'Add Color', 'url'=>array('create', 'ss_id'=>$ss_model->ss_id, 'ss_code'=>$ss_model->style_code)),
);
?>

<h1> <?php echo $ss_model->style_code?>'s Colors</h1>

<?php 
$this->widget('SpecialCListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
	'ss_model'=> $ss_model,
)); 
?>