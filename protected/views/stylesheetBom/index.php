<?php
/* @var $this StylesheetBomController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheet Boms',
);

$this->menu=array(
	array('label'=>'Create StylesheetBom', 'url'=>array('create')),
	array('label'=>'Manage StylesheetBom', 'url'=>array('admin')),
);
?>

<h1>Stylesheet Boms</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
