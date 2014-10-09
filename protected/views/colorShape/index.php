<?php
/* @var $this ColorShapeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Pattern Shapes',
);

$this->menu=array(
	array('label'=>'Create Pattern Shape', 'url'=>array('create')),
	array('label'=>'Manage Pattern Shape', 'url'=>array('admin')),
);
?>

<h1>Pattern Shapes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
