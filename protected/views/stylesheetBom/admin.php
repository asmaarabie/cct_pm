<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */

$this->breadcrumbs=array(
	'Stylesheet Boms'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List StylesheetBom', 'url'=>array('index')),
	array('label'=>'Create StylesheetBom', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#stylesheet-bom-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Stylesheet Boms</h1>

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
	'id'=>'stylesheet-bom-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'ss_bom_id',
		'ss_id',
		'dcs_name',
		'dept_id',
		'class_id',
		'subclass_id',
		/*
		'item_color_id',
		'item_desc',
		'item_cons',
		'item_placement',
		'countryid',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
