<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */

$this->breadcrumbs=array(
	'Subclass Names'=>array('index'),
	$model->subclass_name=>array('view','id'=>$model->subclassid),
	'Update',
);

$this->menu=array(
	array('label'=>'List SubclassName', 'url'=>array('index')),
	array('label'=>'Create SubclassName', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'View SubclassName', 'url'=>array('view', 'id'=>$model->subclassid)),
	array('label'=>'Manage SubclassName', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Update Subclass Name <?php echo $model->subclass_name; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>