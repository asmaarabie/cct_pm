<?php
/* @var $this StylesheetLogController */
/* @var $model StylesheetLog */

$this->breadcrumbs=array(
	'Stylesheet Logs'=>array('index'),
	$model->ss_log_id=>array('view','id'=>$model->ss_log_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StylesheetLog', 'url'=>array('index')),
	array('label'=>'Create StylesheetLog', 'url'=>array('create')),
	array('label'=>'View StylesheetLog', 'url'=>array('view', 'id'=>$model->ss_log_id)),
	array('label'=>'Manage StylesheetLog', 'url'=>array('admin')),
);
?>

<h1>Update StylesheetLog <?php echo $model->ss_log_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>