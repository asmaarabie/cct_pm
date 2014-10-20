<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheet Boms'=>array('index'),
	$model->ss_bom_id=>array('view','id'=>$model->ss_bom_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StylesheetBom', 'url'=>array('index')),
	array('label'=>'Create StylesheetBom', 'url'=>array('create')),
	array('label'=>'View StylesheetBom', 'url'=>array('view', 'id'=>$model->ss_bom_id)),
	array('label'=>'Manage StylesheetBom', 'url'=>array('admin')),
);
?>

<h1>Update StylesheetBom <?php echo $model->ss_bom_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>