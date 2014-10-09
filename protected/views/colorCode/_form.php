<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-code-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'color'); ?>
		<?php echo $form->textField($model,'color',array('size'=>2,'maxlength'=>2)); ?>
		<?php echo $form->error($model,'color'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shadow'); ?>
		<?php echo $form->textField($model,'shadow',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'shadow'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'pattern'); ?>
		<?php echo $form->textField($model,'pattern',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'pattern'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'length'); ?>
		<?php echo $form->textField($model,'length',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'length'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shape'); ?>
		<?php echo $form->textField($model,'shape',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'shape'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'color_serial'); ?>
		<?php echo $form->textField($model,'color_serial',array('size'=>2,'maxlength'=>2)); ?>
		<?php echo $form->error($model,'color_serial'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'color_code'); ?>
		<?php echo $form->textField($model,'color_code',array('size'=>8,'maxlength'=>8)); ?>
		<?php echo $form->error($model,'color_code'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->