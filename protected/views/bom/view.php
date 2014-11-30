<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$model->ss->ss->style_code=>array('stylesheet/view','id'=>$model->ss->ss_id),
	'Bom'=>array('index', 'ss_id'=>$model->ss->ss_id),
	$model->bom_id,
);

?>

<h1>View Bom #<?php echo $model->bom_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'bom_id',
		array (
			'label'=> $model->attributeLabels()['bs_id'],
			'type'=>'raw',
			'value'=>CHtml::link($model->bs_id, array('stylesheet/view', 'id'=>$model->bs_id))),
		array (
			'label'=> $model->attributeLabels()['ss_id'],
			'type'=>'raw',
			'value'=>CHtml::link($model->ss->ss->style_code, array('stylesheet/view', 'id'=>$model->ss->ss->ss_id))),
		'item_desc',
		'item_placement',
		'fulldept',
		'item_qty',
		'item_consumption',
		'item_increase',
		'countryid',
		'itemno',
	),
)); ?>
