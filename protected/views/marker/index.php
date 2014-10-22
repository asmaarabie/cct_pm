<?php
/* @var $this MarkerController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets' => array('stylesheet/index'),
	$ss_code=>array('stylesheet/view', "id"=> $ss_id),
	'Marker'
);

$this->menu=array(
	array('label'=>'Create Marker', 'url'=>array('create'), 'visible'=>count($dataProvider)==0),
	array('label'=>'Delete Marker', 'url'=>'#', 'visible'=> count($dataProvider)!=0,'linkOptions'=>array('submit'=>array('delete','id'=>$model->marker_id),'confirm'=>'Are you sure you want to delete this item?')),
);
?>

<h1>Markers</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
