<?php
/* @var $this ColorController */
/* @var $model Color */

$this->breadcrumbs=array(
	'Colors'=>array('index'),
	$model->color_desc_e=>array('view','id'=>$model->color_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Color', 'url'=>array('index')),
	array('label'=>'Create Color', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View Color', 'url'=>array('view', 'id'=>$model->color_id), 'visible'=> $this->can('view')),
	array('label'=>'Manage Color', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update Color <?php echo $model->color_desc_e; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>