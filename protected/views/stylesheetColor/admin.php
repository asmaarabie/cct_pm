<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */

$this->breadcrumbs=array(
	'Stylesheet Colors'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List StylesheetColor', 'url'=>array('index')),
	array('label'=>'Create StylesheetColor', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#stylesheet-color-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Stylesheet Colors</h1>

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
	'id'=>'stylesheet-color-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'ss_color_id',
		'ss_id',
		'color_code',
		'print',
		'emb',
		'place',
		/*
		'code',
		'ss_color_desc',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
