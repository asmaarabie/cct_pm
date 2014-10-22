<?php
/* @var $this GroupOperationsController */
/* @var $model GroupOperations */

$this->breadcrumbs=array(
	'Group Operations'=>array('index'),
	$model->grp_op_id,
);

$this->menu=array(
	array('label'=>'List GroupOperations', 'url'=>array('index')),
	array('label'=>'Create GroupOperations', 'url'=>array('create')),
	array('label'=>'Update GroupOperations', 'url'=>array('update', 'id'=>$model->grp_op_id)),
	array('label'=>'Delete GroupOperations', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->grp_op_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage GroupOperations', 'url'=>array('admin')),
);
?>

<h1>View GroupOperations #<?php echo $model->grp_op_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'grp_op_id',
		'group_id',
		'op_name',
		'checked',
	),
)); ?>
