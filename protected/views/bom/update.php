<?php
/* @var $this BomController */
/* @var $model Bom */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom'=>array('index', 'ss_id'=>$ss_model->ss_id),
	"Stylesheet item #{$ss_bom_model->ss_bom_id}" => array ('stylesheetBom/view', 'id'=> $ss_bom_model->ss_bom_id),
	'Sub item #' . $model->bom_id=>array('view','id'=>$model->bom_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Bom', 'url'=>array('index')),
	array('label'=>'Create Bom', 'url'=>array('create')),
	array('label'=>'View Bom', 'url'=>array('view', 'id'=>$model->bom_id)),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Update Bom <?php echo $model->bom_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>