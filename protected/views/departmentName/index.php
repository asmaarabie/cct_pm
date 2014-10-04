<?php
/* @var $this DepartmentNameController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Department Names',
);

$this->menu=array(
	array('label'=>'Create DepartmentName', 'url'=>array('create')),
	array('label'=>'Manage DepartmentName', 'url'=>array('admin')),
);
?>

<h1>Department Names</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
