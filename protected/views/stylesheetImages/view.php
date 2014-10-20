<?php
/* @var $this StylesheetImagesController */
/* @var $model StylesheetImages */


$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_model->style_code =>array('stylesheet/view', "id"=> $ss_model->ss_id),
	$model->ss_img_id,
);

$this->menu=array(
	array('label'=>'List StylesheetImages', 'url'=>array('index')),
	array('label'=>'Create StylesheetImages', 'url'=>array('create')),
	array('label'=>'Update StylesheetImages', 'url'=>array('update', 'id'=>$model->ss_img_id)),
	array('label'=>'Delete StylesheetImages', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_img_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StylesheetImages', 'url'=>array('admin')),
);
?>

<h1>View StylesheetImages #<?php echo $model->ss_img_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_img_id',
		'ss_id',
		'img_path',
	),
)); ?>
