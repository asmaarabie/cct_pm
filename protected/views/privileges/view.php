<?php
/* @var $this PrivilegesController */
/* @var $model Privileges */

$this->breadcrumbs=array(
	'Privileges'=>array('index'),
	$model->priv_id,
);

$this->menu=array(
	array('label'=>'List Privileges', 'url'=>array('index')),
	array('label'=>'Create Privileges', 'url'=>array('create')),
	array('label'=>'Update Privileges', 'url'=>array('update', 'id'=>$model->priv_id)),
	array('label'=>'Delete Privileges', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->priv_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Privileges', 'url'=>array('admin')),
);
?>

<h1>View Privileges #<?php echo $model->priv_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'priv_id',
		'priv_name',
	),
)); ?>
