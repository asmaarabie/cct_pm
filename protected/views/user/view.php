<?php
/* @var $this UserController */
/* @var $model User */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	$model->user_id,
);

$this->menu=array(
	array('label'=>'List User', 'url'=>array('index')),
	array('label'=>'Create User', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update User', 'url'=>array('update', 'id'=>$model->user_id), 'visible'=> $this->can('update')),
	array('label'=>'Delete User', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->user_id),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage User', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View User #<?php echo $model->user_id; ?></h1>

<?php 
$user_group = $model->attributeLabels();
$this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'user_id',
		'user_name',
		'mail',
		array (
		'label'=> $user_group['user_group'],
		'type'=>'raw',
		'value'=>CHtml::link (CHtml::encode($model->user_group. " - " . $model->userGroup->group_name), array('group/view', "id"=>$model->userGroup->group_id))),
		),
)); ?>
