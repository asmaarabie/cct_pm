<?php
/* @var $this MarkerController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view', "id"=>$ss_model->ss_id),
	'Markers'
);

$this->menu=array(
	array('label'=>'Create Marker', 'url'=>array('create', 'ss_id'=>$ss_model->ss_id), 'visible'=> $this->can('create')),
	//array('label'=>'Delete Marker', 'url'=>'#', 'visible'=> count($dataProvider)!=0,'linkOptions'=>array('submit'=>array('delete','id'=>$model->marker_id),'confirm'=>'Are you sure you want to delete this item?')),
);
?>

<h1>Markers</h1>
<?php 
if (count($dataProvider->getData())>0)
	echo CHtml::button('Export Markers to PDF', array('submit' => array('exportToPDF', 'ss_id'=>$ss_model->ss_id))); ?>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'stylesheet-markers-grid',
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'marker_name',
		'width',
		'length',
		'utilization',
		't_size',
		'ratio',
		array(
		'class'=>'CButtonColumn',
		'template'=>'{copy} {view} {update} {delete}',
		'buttons' => array(
		'copy' => array( //the name {reply} must be same
				//'label' => 'Copy', // text label of the button
				//'url' => 'CHtml::normalizeUrl(array("dashboard/mail/id/".rawurlencode($data->feedback_email)."/f_id/".$data->feedback_id))', //Your URL According to your wish
				'url' => 'CHtml::normalizeUrl(array("copy", "id" => $data->marker_id))',
				'imageUrl' => Yii::app()->baseUrl . '/images/system-icons/edit.png', // image URL of the button. If not set or false, a text link is used, The image must be 16X16 pixels
				),
		),
		),
	),
)); ?>

