<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */

$this->breadcrumbs=array(
	'Color Codes'=>array('index'),
	$model->color_code,
);

$this->menu=array(
	array('label'=>'List Color Code', 'url'=>array('index')),
	array('label'=>'Create Color Code', 'url'=>array('create')),
	array('label'=>'Update Color Code', 'url'=>array('update', 'id'=>$model->color_code)),
	array('label'=>'Delete Color Code', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->color_code),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Color Code', 'url'=>array('admin')),
);
?>

<h1>View Color Code #<?php echo $model->color_code; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(

		'color_code',
		array(               
			'label'=> $model->attributeLabels()['color'],
			'type'=>'raw',
			'value'=>CHtml::link(CHtml::encode($model->color0->color_desc_e), array('color/view', 'id'=>$model->color0->color_id))),
		array(               
			'label'=> $model->attributeLabels()['shadow'],
			'type'=>'raw',
			'value'=>CHtml::link(CHtml::encode($model->shadow0->shadow_desc_e), array('colorShadow/view', 'id'=>$model->shadow0->color_shadow))),
		array(
		'label'=> $model->attributeLabels()['pattern'],
		'type'=>'raw',
		'value'=>CHtml::link(CHtml::encode($model->pattern0->pattern_desc_e), array('colorPattern/view', 'id'=>$model->pattern0->color_pattern))),
		array(
		'label'=> $model->attributeLabels()['length'],
		'type'=>'raw',
		'value'=>CHtml::link(CHtml::encode($model->length0->length_desc_e), array('colorLength/view', 'id'=>$model->length0->color_length))),
		array(
		'label'=> $model->attributeLabels()['shape'],
		'type'=>'raw',
		'value'=>CHtml::link(CHtml::encode($model->shape0->shape_desc_e), array('colorShape/view', 'id'=>$model->shape0->color_shape))),
		'color_serial',
	),
)); ?>
