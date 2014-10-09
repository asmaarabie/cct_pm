<?php
/* @var $this ColorLengthController */
/* @var $model ColorLength */

$this->breadcrumbs=array(
	'Color Lengths'=>array('index'),
	$model->length_desc_e=>array('view','id'=>$model->color_length),
	'Update',
);

$this->menu=array(
	array('label'=>'List Color Length', 'url'=>array('index')),
	array('label'=>'Create Color Length', 'url'=>array('create')),
	array('label'=>'View Color Length', 'url'=>array('view', 'id'=>$model->color_length)),
	array('label'=>'Manage Color Length', 'url'=>array('admin')),
);
?>

<h1>Update Color Length <?php echo $model->length_desc_e; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>