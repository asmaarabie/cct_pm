<?php
/* @var $this GroupOperationsController */
/* @var $model GroupOperations */

$this->breadcrumbs=array(
	'Group Operations'=>array('index'),
	$model->grp_op_id=>array('view','id'=>$model->grp_op_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List GroupOperations', 'url'=>array('index')),
	array('label'=>'Create GroupOperations', 'url'=>array('create')),
	array('label'=>'View GroupOperations', 'url'=>array('view', 'id'=>$model->grp_op_id)),
	array('label'=>'Manage GroupOperations', 'url'=>array('admin')),
);
?>

<h1>Update GroupOperations <?php echo $model->grp_op_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>