<?php
/* @var $this StylesheetLogController */
/* @var $model StylesheetLog */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-log-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'stylesheet_id'); ?>
		<?php echo $form->textField($model,'stylesheet_id'); ?>
		<?php echo $form->error($model,'stylesheet_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'action_time_stamp'); ?>
		<?php echo $form->textField($model,'action_time_stamp'); ?>
		<?php echo $form->error($model,'action_time_stamp'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'action_type'); ?>
		<?php echo $form->textField($model,'action_type',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'action_type'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'action_comment'); ?>
		<?php echo $form->textArea($model,'action_comment',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'action_comment'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user'); ?>
		<?php echo $form->textField($model,'user'); ?>
		<?php echo $form->error($model,'user'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->