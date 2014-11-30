<?php
/* @var $this IsoHeaderController */
/* @var $model IsoHeader */

$this->breadcrumbs=array(
	'Iso Headers'=>array('index'),
	$model->header_id=>array('view','id'=>$model->header_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List IsoHeader', 'url'=>array('index')),
	array('label'=>'Create IsoHeader', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View IsoHeader', 'url'=>array('view', 'id'=>$model->header_id)),
	array('label'=>'Manage IsoHeader', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update IsoHeader <?php echo $model->header_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>