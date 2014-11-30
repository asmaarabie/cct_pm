<?php
/* @var $this IsoHeaderController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Iso Headers',
);

$this->menu=array(
	array('label'=>'Create IsoHeader', 'url'=>array('create')),
	array('label'=>'Manage IsoHeader', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Iso Headers</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
