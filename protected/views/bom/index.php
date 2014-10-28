<?php
/* @var $this BomController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Boms',
);

$this->menu=array(
	array('label'=>'Create Bom', 'url'=>array('create')),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Boms</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
