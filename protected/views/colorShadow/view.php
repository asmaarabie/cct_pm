<?php
/* @var $this ColorShadowController */
/* @var $model ColorShadow */

$this->breadcrumbs=array(
	'Color Shadows'=>array('index'),
	$model->shadow_desc_e,
);

$this->menu=array(
	array('label'=>'List Color Shadow', 'url'=>array('index')),
	array('label'=>'Create Color Shadow', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update Color Shadow', 'url'=>array('update', 'id'=>$model->color_shadow), 'visible'=> $this->can('update')),
	array('label'=>'Delete Color Shadow', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_shadow),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage Color Shadow', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View Color Shadow #<?php echo $model->shadow_desc_e; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'color_shadow',
		'shadow_desc_e',
		'shadow_desc_a',
	),
)); ?>
