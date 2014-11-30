<?php
/* @var $this GroupController */
/* @var $model Group */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'group-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	<?php if(Yii::app()->user->hasFlash('group_operation')) { ?>
		<div class="flash-error">
			<?php echo Yii::app()->user->getFlash('group_operation'); ?>
		</div>
	<?php } ?>
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'group_name'); ?>
		<?php echo $form->textField($model,'group_name',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'group_name'); ?>
	</div>
	
	<div class="row">
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
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["view"]'
		),
		array(
				'id' => 'create',
				'headerTemplate' =>'Create<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["create"]'
		),
		array(
				'id' => 'update',
				'headerTemplate' =>'Update<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["update"]'
		),
		array(
				'id' => 'delete',
				'headerTemplate' =>'Delete<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["delete"]'
		),
		array(
				'id' => 'admin',
				'headerTemplate' =>'Admin<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["admin"]'
		),
		array(
				'id' => 'updateOwn',
				'headerTemplate' =>'Update Own<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["updateOwn"]'
		),
		array(
				'id' => 'deleteOwn',
				'headerTemplate' =>'Delete Own<br/>{item}',
				'class'=>'CCheckBoxColumn',
				'selectableRows'=>$count,
				'cssClassExpression'=>"'my-checkbox-column'",
				'checked'=>'$data["deleteOwn"]'
		),
	),
)); ?>
	</div>
	
	<div class="row buttons" style="float: right">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>
	<div style="clear:both">
	</div>
<?php $this->endWidget(); ?>

</div><!-- form -->