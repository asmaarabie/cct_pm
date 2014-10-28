<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Boms'=>array('index'),
	$model->bom_id=>array('view','id'=>$model->bom_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Bom', 'url'=>array('index')),
	array('label'=>'Create Bom', 'url'=>array('create')),
	array('label'=>'View Bom', 'url'=>array('view', 'id'=>$model->bom_id)),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Update Bom <?php echo $model->bom_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>