<?php
/* @var $this StylesheetLogController */
/* @var $model StylesheetLog */

$this->breadcrumbs=array(
	'Stylesheet Logs'=>array('index'),
	$model->ss_log_id,
);

$this->menu=array(
	array('label'=>'List StylesheetLog', 'url'=>array('index')),
	array('label'=>'Create StylesheetLog', 'url'=>array('create')),
	array('label'=>'Update StylesheetLog', 'url'=>array('update', 'id'=>$model->ss_log_id)),
	array('label'=>'Delete StylesheetLog', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_log_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StylesheetLog', 'url'=>array('admin')),
);
?>

<h1>View StylesheetLog #<?php echo $model->ss_log_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_log_id',
		'stylesheet_id',
		'action_time_stamp',
		'action_type',
		'action_comment',
		'user',
	),
)); ?>
