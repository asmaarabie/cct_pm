<?php
/* @var $this GroupController */
/* @var $model Group */

$this->breadcrumbs=array(
	'Groups'=>array('index'),
	$model->group_name,
);

$this->menu=array(
	array('label'=>'List Group', 'url'=>array('index')),
	array('label'=>'Create Group', 'url'=>array('create')),
	array('label'=>'Update Group', 'url'=>array('update', 'id'=>$model->group_id)),
	array('label'=>'Delete Group', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->group_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Group', 'url'=>array('admin')),
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
<ul>
<?php 

if (count($operations) == 0) 
	echo "No operations selected for this group ". CHtml::link('Add operations', array('group/update', 'id'=>$model->group_id));
else {
	foreach ($operations as $operation) {
		/*preg_match_all('/((?:^|[A-Z])[a-z]+)/',$operation->privilege->op_name,$matches);
		// 0=> action 1=> own/"" 2=> model
		$action = $matches[0][0];
		$modelName = ($matches[0][1] == "Own")? $matches[0][2]: $matches[0][1];
		echo CHtml::link (ucwords($action). " ". $modelName, array(lcfirst($modelName)."/".$action));
		*/
		
		if ( $operation->checked) 
			echo "<li>".$operation->opName->operation."</li>";
	}
}
?>
</ul>
</div>
<div class = "stylesheet-galleryView">
<h2>Users in this group:</h2>
<?php 
	$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$usersDataProvider,
	'itemView'=>'_viewU',
)); ?>


</div>