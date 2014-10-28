<?php
/* @var $this BomLogController */
/* @var $model BomLog */

$this->breadcrumbs=array(
	'Bom Logs'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List BomLog', 'url'=>array('index')),
	array('label'=>'Create BomLog', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#bom-log-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Bom Logs</h1>

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
	'id'=>'bom-log-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'bom_log_id',
		'bom_id',
		'action_time_stamp',
		'action_type',
		'action_comment',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
