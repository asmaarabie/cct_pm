<?php
/* @var $this GroupController */
/* @var $model Group */

$this->breadcrumbs=array(
	'Groups'=>array('index'),
	$model->group_name,
);

$this->menu=array(
	array('label'=>'List Group', 'url'=>array('index')),
	array('label'=>'Create Group', 'url'=>array('create'), 'visible'=> $this->can('create')),
	array('label'=>'Update Group', 'url'=>array('update', 'id'=>$model->group_id), 'visible'=> $this->can('update')),
	array('label'=>'Delete Group', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->group_id),'confirm'=>'Are you sure you want to delete this item?'), 'visible'=> $this->can('delete')),
	array('label'=>'Manage Group', 'url'=>array('admin'), 'visible'=> $this->can('admin')),
);
?>

<h1>View Group: <?php echo $model->group_name; ?></h1>

<div class = "stylesheet-galleryView">
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'group_id',
		'group_name',
	),
)); ?>

</div>
<div class = "stylesheet-galleryView">
	<h2>Allowed operations for this group:</h2>
	<?php 
	$count = count($operations->getData());
	$this->widget('zii.widgets.grid.CGridView', array(
		'id'=>'group-grid',
		'dataProvider'=>$operations,
		'summaryText'=>'',
		
		'columns'=>array(
			array(
				'name'=>'id',
				'header'=> 'Operation',
				'class'=>'CDataColumn',
				'htmlOptions' => array('width'=>'100px'),
			),
			array(
					'id' => 'view',
					'headerTemplate' =>'View<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["view"]'
			),
			array(
					'id' => 'create',
					'headerTemplate' =>'Create<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["create"]'
			),
			array(
					'id' => 'update',
					'headerTemplate' =>'Update<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["update"]'
			),
			array(
					'id' => 'delete',
					'headerTemplate' =>'Delete<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["delete"]'
			),
			array(
					'id' => 'admin',
					'headerTemplate' =>'Admin<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["admin"]'
			),
			array(
					'id' => 'updateOwn',
					'headerTemplate' =>'Update Own<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["updateOwn"]'
			),
			array(
					'id' => 'deleteOwn',
					'headerTemplate' =>'Delete Own<br/>{item}',
					'class'=>'CCheckBoxColumn',
					'selectableRows'=>0,
					'cssClassExpression'=>"'my-checkbox-column'",
					'checked'=>'$data["deleteOwn"]'
			),
		),
	)); ?>
</div>
<div class = "stylesheet-galleryView">
<h2>Users in this group:</h2>
<?php 
	$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$usersDataProvider,
	'itemView'=>'_viewU',
)); ?>


</div>