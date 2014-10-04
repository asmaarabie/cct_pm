<?php
/* @var $this DCSNameController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'DCS Names',
);

$this->menu=array(
	array('label'=>'Create DCSName', 'url'=>array('create')),
	array('label'=>'Manage DCSName', 'url'=>array('admin')),
);
?>

<h1>DCS Names</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
