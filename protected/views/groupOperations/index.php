<?php
/* @var $this GroupOperationsController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Group Operations',
);

$this->menu=array(
	array('label'=>'Create GroupOperations', 'url'=>array('create')),
	array('label'=>'Manage GroupOperations', 'url'=>array('admin')),
);
?>

<h1>Group Operations</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
