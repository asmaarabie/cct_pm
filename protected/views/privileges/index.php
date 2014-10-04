<?php
/* @var $this PrivilegesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Privileges',
);

$this->menu=array(
	array('label'=>'Create Privileges', 'url'=>array('create')),
	array('label'=>'Manage Privileges', 'url'=>array('admin')),
);
?>

<h1>Privileges</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
