<?php
/* @var $this SubclassNameController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Subclass Names',
);

$this->menu=array(
	array('label'=>'Create SubclassName', 'url'=>array('create')),
	array('label'=>'Manage SubclassName', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Subclass Names</h1>

<?php 

$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
	
)); ?>
