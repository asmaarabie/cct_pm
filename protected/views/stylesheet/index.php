<?php
/* @var $this StylesheetController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets',
);

$this->menu=array(
	array('label'=>'Create Stylesheet', 'url'=>array('create')),
	array('label'=>'Manage Stylesheet', 'url'=>array('admin')),
);
?>
<?php 
if(!Yii::app()->user->isGuest && Yii::app()->authManager->checkAccess('adminStylesheet', Yii::app()->user->id))
	echo "EHM";
	
?>

<h1>Stylesheets</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>

