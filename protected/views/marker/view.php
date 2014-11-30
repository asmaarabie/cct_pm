<?php
/* @var $this MarkerController */
/* @var $model Marker */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$model->ss->style_code=>array('stylesheet/view', "id"=> $model->ss_id),
	'Markers' => array('Marker/index', 'ss_id'=> $model->ss_id),
	$model->marker_name,
);

$this->menu=array(
	array('label'=>'Copy Marker', 'url'=>array('copy', 'id'=>$model->marker_id), 'visible'=> $this->can('create')),
	array('label'=>'Create Marker', 'url'=>array('create', 'ss_id'=>$model->ss_id), 'visible'=> $this->can('create')),
	array('label'=>'Update Marker', 'url'=>array('update', 'id'=>$model->marker_id), 'visible'=> $this->can('update', $model)),
	array('label'=>'Delete Marker', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->marker_id),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete', $model)),
);
?>

<h1>View Marker #<?php echo $model->marker_name; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'marker_id',
		'marker_name',
		array (
			'label'=> $model->attributeLabels()['ss_id'],
			'type'=>'raw',
			'value'=>CHtml::link (CHtml::encode($model->ss->style_code), array ('stylesheet/view', 'id' => $model->ss_id)),
		),
		'width',
		'length',
		'utilization',
		't_size',
		'ratio',
		array (
		'label'=> $model->attributeLabels()['owner'],
		'type'=>'raw',
		'value'=>CHtml::link (CHtml::encode($model->owner0->user_name), array ('user/view', 'id' => $model->owner)),
		),
		
	),
)); ?>

<div class="stylesheet-galleryView" id="marker_log">
<?php 
echo CHtml::ajaxSubmitButton('View Marker Log',          // the link body (it will NOT be HTML-encoded.)
    array("marker/getLogEntries&marker_id={$model->marker_id}"), // the URL for the AJAX request. If empty, it is assumed to be the current URL.
    array(
        'update'=>'#marker_log',
    )
);
?>
</div>
