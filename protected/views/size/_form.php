<?php
/* @var $this SizeController */
/* @var $model Size */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'size-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'scale_number'); ?>
		<?php echo $form->textField($model,'scale_number',array('size'=>5,'maxlength'=>5)); ?>
		<?php echo $form->error($model,'scale_number'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'scale_size'); ?>
		<p class="note">Add sizes comma separated (ex. S,M,L,XL)</p>
		<?php echo $form->textField($model,'scale_size',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'scale_size'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'scale_name'); ?>
		<?php echo $form->textField($model,'scale_name',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'scale_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->