<?php
/* @var $this BomsheetController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom',
);
$this->menu=array(
		array('label'=>'Create Bomsheet', 'url'=>array('create', 'ss_id'=>$ss_model->ss_id), 'visible'=> $this->can('create')),
);

?>

<h1>Bom</h1>

No results found.