<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Boms'=>array('index'),
	$model->bom_id,
);

$this->menu=array(
	array('label'=>'List Bom', 'url'=>array('index')),
	array('label'=>'Create Bom', 'url'=>array('create')),
	array('label'=>'Update Bom', 'url'=>array('update', 'id'=>$model->bom_id)),
	array('label'=>'Delete Bom', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->bom_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>View Bom #<?php echo $model->bom_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'bom_id',
		'ss_id',
		'item_desc',
		'item_placement',
		'fulldept',
		'item_qty',
		'item_consumption',
		'item_increase',
		'pono',
		'countryid',
		'itemno',
	),
)); ?>
