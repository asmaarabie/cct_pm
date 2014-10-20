<?php
/* @var $this StylesheetImagesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_model->style_code =>array('stylesheet/view', "id"=> $ss_model->ss_id),
	'Images',
);

$this->menu=array(
	array('label'=>'Upload Image', 'url'=>array('create', 'ss_id'=>$ss_model->ss_id, 'ss_code'=>$ss_model->style_code)),
	//array('label'=>'Manage StylesheetImages', 'url'=>array('admin')),
);
?>

<h1><?php echo $ss_model->style_code."'s Images"?></h1>

<?php 
$this->widget('SpecialCListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
	'ss_model'=> $ss_model,
)); ?>
