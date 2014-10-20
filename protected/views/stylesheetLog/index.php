<?php
/* @var $this StylesheetLogController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheet Logs',
);

$this->menu=array(
	array('label'=>'Create StylesheetLog', 'url'=>array('create')),
	array('label'=>'Manage StylesheetLog', 'url'=>array('admin')),
);
?>

<h1>Stylesheet Logs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
