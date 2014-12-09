<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom Items'=>array('index', 'ss_id'=> $ss_model->ss_id),
	$model->ss_bom_id,
);

$this->menu=array(
	array('label'=>'Update StylesheetBom', 'url'=>array('update', 'id'=>$model->ss_bom_id), 'visible'=> $this->can('update', $ss_model)),
	array('label'=>'Delete StylesheetBom', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_bom_id),'confirm'=>'Are you sure you want to delete this item?')
			, 'visible'=> $this->can('update',$ss_model)
),
);
?>

<h1>View StylesheetBom #<?php echo $model->ss_bom_id; ?></h1>

<?php 
$ss_id = $model->attributeLabels(); $ss_id = $ss_id['ss_id'];
$countryid = $model->attributeLabels(); $countryid = $countryid['countryid'];
$itemColorId = $model->attributeLabels(); $itemColorId = $itemColorId['item_color_id']
$this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_bom_id',
		array (
			'label'=> $ss_id,
				'type'=>'raw',
				'value'=>CHtml::link(CHtml::encode($model->ss->style_code), array('stylesheet/view', 'id'=> $model->ss_id))
		),
		array (
				'label'=> $countryid,
				'type'=>'raw',
				'value'=>CHtml::encode($model->country->countrydesc)
		),
		'dcs_name',
		'fulldept',
		array (
				'label'=> $itemColorId,
				'type'=>'raw',
				'value'=>CHtml::link(CHtml::encode($model->item_color_id), array('colorCode/view', 'id'=> $model->item_color_id))
		),
		'item_desc',
		'item_cons',
		'item_placement',
		
	),
)); ?>
