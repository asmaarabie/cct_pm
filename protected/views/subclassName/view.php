<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */

$this->breadcrumbs=array(
	'Subclass Names'=>array('index'),
	$model->subclass_name,
);

$this->menu=array(
	array('label'=>'List SubclassName', 'url'=>array('index')),
	array('label'=>'Create SubclassName', 'url'=>array('create'),'visible'=> $this->can('create')),
	array('label'=>'Update SubclassName', 'url'=>array('update', 'id'=>$model->subclassid), 'visible'=> $this->can('update')),
	array('label'=>'Delete SubclassName', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->subclassid),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage SubclassName', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View Subclass Name #<?php echo $model->subclass_name; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'subclassid',
		'subclass_name',
		'countryid'
	),
)); ?>
