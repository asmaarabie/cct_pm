<?php
/* @var $this ColorShapeController */
/* @var $model ColorShape */

$this->breadcrumbs=array(
	'Pattern Shapes'=>array('index'),
	$model->shape_desc_e=>array('view','id'=>$model->color_shape),
	'Update',
);

$this->menu=array(
	array('label'=>'List Pattern Shape', 'url'=>array('index')),
	array('label'=>'Create Pattern Shape', 'url'=>array('create')),
	array('label'=>'View Pattern Shape', 'url'=>array('view', 'id'=>$model->color_shape)),
	array('label'=>'Manage Pattern Shape', 'url'=>array('admin')),
);
?>

<h1>Update Pattern Shape <?php echo $model->shape_desc_e; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>