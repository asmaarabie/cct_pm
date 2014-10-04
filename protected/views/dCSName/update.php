<?php
/* @var $this DCSNameController */
/* @var $model DCSName */

$this->breadcrumbs=array(
	'DCS Names'=>array('index'),
	$model->dcs_name=>array('view','id'=>$model->dcs_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List DCSName', 'url'=>array('index')),
	array('label'=>'Create DCSName', 'url'=>array('create')),
	array('label'=>'View DCSName', 'url'=>array('view', 'id'=>$model->dcs_id)),
	array('label'=>'Manage DCSName', 'url'=>array('admin')),
);
?>

<h1>Update DCS Name <?php echo $model->dcs_name; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>