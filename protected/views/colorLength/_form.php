<?php
/* @var $this ColorLengthController */
/* @var $model ColorLength */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-length-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	<br/>
	<p class="note">Suit Drops S,R or L - Digit # 5 in color code</p>
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'color_length'); ?>
		<?php echo $form->textField($model,'color_length',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'color_length'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'length_desc_e'); ?>
		<?php echo $form->textField($model,'length_desc_e',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'length_desc_e'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'length_desc_a'); ?>
		<?php echo $form->textField($model,'length_desc_a',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'length_desc_a'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->