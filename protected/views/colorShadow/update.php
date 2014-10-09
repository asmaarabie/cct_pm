<?php
/* @var $this ColorShadowController */
/* @var $model ColorShadow */

$this->breadcrumbs=array(
	'Color Shadows'=>array('index'),
	$model->shadow_desc_e=>array('view','id'=>$model->color_shadow),
	'Update',
);

$this->menu=array(
	array('label'=>'List Color Shadow', 'url'=>array('index')),
	array('label'=>'Create Color Shadow', 'url'=>array('create')),
	array('label'=>'View Color Shadow', 'url'=>array('view', 'id'=>$model->color_shadow)),
	array('label'=>'Manage Color Shadow', 'url'=>array('admin')),
);
?>

<h1>Update Color Shadow <?php echo $model->shadow_desc_e; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>