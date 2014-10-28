<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$model->ss->style_code=>array('stylesheet/view','id'=>$model->ss_id),
	'Bom Items'=>array('index', 'ss_id'=> $model->ss_id),
	$model->ss_bom_id,
);

$this->menu=array(
	array('label'=>'Update StylesheetBom', 'url'=>array('update', 'id'=>$model->ss_bom_id)),
	array('label'=>'Delete StylesheetBom', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_bom_id),'confirm'=>'Are you sure you want to delete this item?')),
);
?>

<h1>View StylesheetBom #<?php echo $model->ss_bom_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_bom_id',
		array (
			'label'=> $model->attributeLabels()['ss_id'],
				'type'=>'raw',
				'value'=>CHtml::link(CHtml::encode($model->ss->style_code), array('stylesheet/view', 'id'=> $model->ss_id))
		),
		array (
				'label'=> $model->attributeLabels()['countryid'],
				'type'=>'raw',
				'value'=>CHtml::encode($model->country->countrydesc)
		),
		'dcs_name',
		'code',
		array (
				'label'=> $model->attributeLabels()['item_color_id'],
				'type'=>'raw',
				'value'=>CHtml::link(CHtml::encode($model->item_color_id), array('colorCode/view', 'id'=> $model->item_color_id))
		),
		'item_desc',
		'item_cons',
		'item_placement',
		
	),
)); ?>
