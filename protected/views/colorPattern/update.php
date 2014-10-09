<?php
/* @var $this ColorPatternController */
/* @var $model ColorPattern */

$this->breadcrumbs=array(
	'Color Patterns'=>array('index'),
	$model->pattern_desc_e=>array('view','id'=>$model->color_pattern),
	'Update',
);

$this->menu=array(
	array('label'=>'List Color Pattern', 'url'=>array('index')),
	array('label'=>'Create Color Pattern', 'url'=>array('create')),
	array('label'=>'View Color Pattern', 'url'=>array('view', 'id'=>$model->color_pattern)),
	array('label'=>'Manage Color Pattern', 'url'=>array('admin')),
);
?>

<h1>Update Color Pattern <?php echo $model->pattern_desc_e; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>