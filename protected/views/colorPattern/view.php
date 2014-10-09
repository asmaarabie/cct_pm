<?php
/* @var $this ColorPatternController */
/* @var $model ColorPattern */

$this->breadcrumbs=array(
	'Color Patterns'=>array('index'),
	$model->pattern_desc_e,
);

$this->menu=array(
	array('label'=>'List Color Pattern', 'url'=>array('index')),
	array('label'=>'Create Color Pattern', 'url'=>array('create')),
	array('label'=>'Update Color Pattern', 'url'=>array('update', 'id'=>$model->color_pattern)),
	array('label'=>'Delete Color Pattern', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_pattern),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Color Pattern', 'url'=>array('admin')),
);
?>

<h1>View Color Pattern #<?php echo $model->pattern_desc_e; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'color_pattern',
		'pattern_desc_e',
		'pattern_desc_a',
	),
)); ?>
