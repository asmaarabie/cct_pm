<?php
/* @var $this DCSSizeScaleController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'DCS Size Scales',
);

$this->menu=array(
	array('label'=>'Create DCS Size Scale', 'url'=>array('create')),
	array('label'=>'Manage DCS Size Scale', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>DCS Size Scales</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
