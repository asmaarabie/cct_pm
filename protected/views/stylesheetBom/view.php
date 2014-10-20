<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheet Boms'=>array('index'),
	$model->ss_bom_id,
);

$this->menu=array(
	array('label'=>'List StylesheetBom', 'url'=>array('index')),
	array('label'=>'Create StylesheetBom', 'url'=>array('create')),
	array('label'=>'Update StylesheetBom', 'url'=>array('update', 'id'=>$model->ss_bom_id)),
	array('label'=>'Delete StylesheetBom', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_bom_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StylesheetBom', 'url'=>array('admin')),
);
?>

<h1>View StylesheetBom #<?php echo $model->ss_bom_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_bom_id',
		'ss_id',
		'dcs_name',
		'dept_id',
		'class_id',
		'subclass_id',
		'item_color_id',
		'item_desc',
		'item_cons',
		'item_placement',
		'countryid',
	),
)); ?>
