<?php
/* @var $this PrivilegesController */
/* @var $model Privileges */

$this->breadcrumbs=array(
	'Privileges'=>array('index'),
	$model->priv_id=>array('view','id'=>$model->priv_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Privileges', 'url'=>array('index')),
	array('label'=>'Create Privileges', 'url'=>array('create')),
	array('label'=>'View Privileges', 'url'=>array('view', 'id'=>$model->priv_id)),
	array('label'=>'Manage Privileges', 'url'=>array('admin')),
);
?>

<h1>Update Privileges <?php echo $model->priv_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>