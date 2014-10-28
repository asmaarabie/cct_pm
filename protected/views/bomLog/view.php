<?php
/* @var $this BomLogController */
/* @var $model BomLog */

$this->breadcrumbs=array(
	'Bom Logs'=>array('index'),
	$model->bom_log_id,
);

$this->menu=array(
	array('label'=>'List BomLog', 'url'=>array('index')),
	array('label'=>'Create BomLog', 'url'=>array('create')),
	array('label'=>'Update BomLog', 'url'=>array('update', 'id'=>$model->bom_log_id)),
	array('label'=>'Delete BomLog', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->bom_log_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage BomLog', 'url'=>array('admin')),
);
?>

<h1>View BomLog #<?php echo $model->bom_log_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'bom_log_id',
		'bom_id',
		'action_time_stamp',
		'action_type',
		'action_comment',
	),
)); ?>
