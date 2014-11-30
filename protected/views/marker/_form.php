<?php
/* @var $this MarkerController */
/* @var $model Marker */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'marker-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php 
	if ($model->isNewRecord)
		echo $form->errorSummary($model);
	else 
		echo $form->errorSummary(array($model, $log));
	?>
	
	
	<div class="row">
		<?php echo $form->labelEx($model,'marker_name'); ?>
		<?php echo $form->textField($model,'marker_name',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'marker_name'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'width'); ?>
		<?php echo $form->textField($model,'width'); ?>
		<?php echo $form->error($model,'width'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'length'); ?>
		<?php echo $form->textField($model,'length'); ?>
		<?php echo $form->error($model,'length'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'utilization'); ?>
		<?php echo $form->textField($model,'utilization'); ?>
		<?php echo $form->error($model,'utilization'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'t_size'); ?>
		<?php echo $form->textField($model,'t_size'); ?>
		<?php echo $form->error($model,'t_size'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ratio'); ?>
		<?php echo $form->textField($model,'ratio',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'ratio'); ?>
	</div>
	
	<?php if (!$model->isNewRecord ) {?>
	<div class="row">
		<?php echo $form->labelEx($log,'action_comment'); ?>
		<?php echo $form->textArea($log,'action_comment',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($log,'action_comment'); ?>
	</div>
	<?php }?>
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->