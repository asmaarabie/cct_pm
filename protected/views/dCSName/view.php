<?php
/* @var $this DCSNameController */
/* @var $model DCSName */

$this->breadcrumbs=array(
	'DCS Names'=>array('index'),
	$model->dcs_name,
);

$this->menu=array(
	array('label'=>'List DCSName', 'url'=>array('index')),
	array('label'=>'Create DCSName', 'url'=>array('create')),
	array('label'=>'Update DCSName', 'url'=>array('update', 'id'=>$model->dcs_id)),
	array('label'=>'Delete DCSName', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->dcs_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage DCSName', 'url'=>array('admin')),
);
?>

<h1>View DCS Name #<?php echo $model->dcs_name; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'dcs_id',
		'fulldept',
		array(               // related Country displayed as a name
				'label'=> $model->attributeLabels()['country_id'],
				'type'=>'raw',
				//'value'=>CHtml::link(CHtml::encode($model->city->name),array('city/view','id'=>$model->city->id))),
				'value'=>CHtml::encode($model->country->countrydesc)),
		//'country_id',
		'dcs_name',
	),
)); ?>
