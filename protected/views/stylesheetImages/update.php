<?php
/* @var $this StylesheetImagesController */
/* @var $model StylesheetImages */

$this->breadcrumbs=array(
	'Stylesheet Images'=>array('index'),
	$model->ss_img_id=>array('view','id'=>$model->ss_img_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StylesheetImages', 'url'=>array('index')),
	array('label'=>'Create StylesheetImages', 'url'=>array('create')),
	array('label'=>'View StylesheetImages', 'url'=>array('view', 'id'=>$model->ss_img_id)),
	array('label'=>'Manage StylesheetImages', 'url'=>array('admin')),
);
?>

<h1>Update StylesheetImages <?php echo $model->ss_img_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>