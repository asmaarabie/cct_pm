<?php
/* @var $this ColorLengthController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Color Lengths',
);

$this->menu=array(
	array('label'=>'Create Color Length', 'url'=>array('create')),
	array('label'=>'Manage Color Length', 'url'=>array('admin')),
);
?>

<h1>Color Lengths</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
