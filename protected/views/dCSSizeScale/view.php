<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */

$this->breadcrumbs=array(
	'DCS Size Scales'=>array('index'),
	$model->size_fulldept.'- Scale:'.$model->size_scale,
);

$this->menu=array(
	array('label'=>'List DCS Size Scale', 'url'=>array('index')),
	array('label'=>'Create DCS Size Scale', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update DCS Size Scale', 'url'=>array('update', 'id'=>$model->DCS_size_id), 'visible'=> $this->can('update')),
	array('label'=>'Delete DCS Size Scale', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->DCS_size_id),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage DCS Size Scale', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View DCS Size Scale #<?php echo $model->size_scale.' for '.$model->size_fulldept; ?></h1>

<?php 
$size_scale = $model->attributeLabels();
$countryid= $model->attributeLabels();
$this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		//'DCS_size_id',
		array(              
				'label'=> $size_scale['size_scale'],
				'type'=>'raw',
				'value'=>CHtml::link(CHtml::encode($model->sizeScale->scale_name), array('size/view', 'id'=>$model->sizeScale->scale_number))),
		'size_fulldept',
		array(              
			'label'=> $countryid['size_country_id'],
			'type'=>'raw',
			'value'=>CHtml::encode($model->sizeCountry->countrydesc)),
	),
)); ?>
