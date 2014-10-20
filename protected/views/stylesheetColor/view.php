<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */

$this->breadcrumbs=array(
	'Stylesheet Colors'=>array('index'),
	$model->ss_color_id,
);

$this->menu=array(
	array('label'=>'List StylesheetColor', 'url'=>array('index')),
	array('label'=>'Create StylesheetColor', 'url'=>array('create')),
	array('label'=>'Update StylesheetColor', 'url'=>array('update', 'id'=>$model->ss_color_id)),
	array('label'=>'Delete StylesheetColor', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_color_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StylesheetColor', 'url'=>array('admin')),
);
?>

<h1>View StylesheetColor #<?php echo $model->ss_color_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_color_id',
		'ss_id',
		'color_code',
		'print',
		'emb',
		'place',
		'code',
		'ss_color_desc',
	),
)); ?>
