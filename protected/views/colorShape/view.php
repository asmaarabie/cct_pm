<?php
/* @var $this ColorShapeController */
/* @var $model ColorShape */

$this->breadcrumbs=array(
	'Pattern Shapes'=>array('index'),
	$model->shape_desc_e,
);

$this->menu=array(
	array('label'=>'List Pattern Shape', 'url'=>array('index')),
	array('label'=>'Create Pattern Shape', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update Pattern Shape', 'url'=>array('update', 'id'=>$model->color_shape), 'visible'=> $this->can('update')),
	array('label'=>'Delete Pattern Shape', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_shape),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage Pattern Shape', 'url'=>array('admin'),'visible'=> $this->can('admin')),
);
?>

<h1>View Pattern Shape #<?php echo $model->shape_desc_e; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'color_shape',
		'shape_desc_e',
		'shape_desc_a',
	),
)); ?>
