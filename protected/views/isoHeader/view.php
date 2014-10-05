<?php
/* @var $this IsoHeaderController */
/* @var $model IsoHeader */

$this->breadcrumbs=array(
	'Iso Headers'=>array('index'),
	$model->header_id,
);

$this->menu=array(
	array('label'=>'List IsoHeader', 'url'=>array('index')),
	array('label'=>'Create IsoHeader', 'url'=>array('create')),
	array('label'=>'Update IsoHeader', 'url'=>array('update', 'id'=>$model->header_id)),
	array('label'=>'Delete IsoHeader', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->header_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage IsoHeader', 'url'=>array('admin')),
);
?>

<h1>View IsoHeader #<?php echo $model->header_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'header_id',
		'header_code',
		'version',
		'date',
	),
)); ?>
