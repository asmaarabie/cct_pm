<?php
/* @var $this ColorPatternController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Color Patterns',
);

$this->menu=array(
	array('label'=>'Create Color Pattern', 'url'=>array('create')),
	array('label'=>'Manage Color Pattern', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Color Patterns</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
