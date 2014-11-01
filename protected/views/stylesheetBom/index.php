<?php
/* @var $this StylesheetBomController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom Items',
);

$this->menu=array(
	array('label'=>'Create Bom Items', 'url'=>array('create', 'ss_id'=>$ss_model->ss_id)),
);
?>

<h1><?php echo $ss_model->style_code?>'s Bom Items</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'stylesheet-accessories-grid',
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'dcs_name',
		'fulldept',
		'item_color_id',
		'item_desc',
		'item_cons',
		'item_placement',
		array(
		'class'=>'CButtonColumn',
		),
	),
)); ?>
