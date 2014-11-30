<?php
/* @var $this IsoHeaderController */
/* @var $model IsoHeader */

$this->breadcrumbs=array(
	'Iso Headers'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List IsoHeader', 'url'=>array('index')),
	array('label'=>'Manage IsoHeader', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>Create IsoHeader</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>