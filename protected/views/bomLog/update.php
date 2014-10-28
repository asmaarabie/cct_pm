<?php
/* @var $this BomLogController */
/* @var $model BomLog */

$this->breadcrumbs=array(
	'Bom Logs'=>array('index'),
	$model->bom_log_id=>array('view','id'=>$model->bom_log_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List BomLog', 'url'=>array('index')),
	array('label'=>'Create BomLog', 'url'=>array('create')),
	array('label'=>'View BomLog', 'url'=>array('view', 'id'=>$model->bom_log_id)),
	array('label'=>'Manage BomLog', 'url'=>array('admin')),
);
?>

<h1>Update BomLog <?php echo $model->bom_log_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>