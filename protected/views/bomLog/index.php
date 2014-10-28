<?php
/* @var $this BomLogController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Bom Logs',
);

$this->menu=array(
	array('label'=>'Create BomLog', 'url'=>array('create')),
	array('label'=>'Manage BomLog', 'url'=>array('admin')),
);
?>

<h1>Bom Logs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
