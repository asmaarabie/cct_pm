<?php
/* @var $this StylesheetController */
/* @var $model Stylesheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Stylesheet', 'url'=>array('index')),
	array('label'=>'Create Stylesheet', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#stylesheet-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Stylesheets</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'stylesheet-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'ss_id',
		'country_id',
		'dept_id',
		'class_id',
		'subclass_id',
		'season',
		/*
		'year',
		'pono',
		'dcs_notes',
		'style_code',
		'stylesheet_note',
		'fabric',
		'scale',
		'sizes,
		'user_id',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
