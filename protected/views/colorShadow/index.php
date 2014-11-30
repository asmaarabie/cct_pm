<?php
/* @var $this ColorShadowController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Color Shadows',
);

$this->menu=array(
	array('label'=>'Create Color Shadow', 'url'=>array('create')),
	array('label'=>'Manage Color Shadow', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Color Shadows</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
