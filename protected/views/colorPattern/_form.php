<?php
/* @var $this ColorPatternController */
/* @var $model ColorPattern */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-pattern-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	<br/>
	<p class="note">ex. E: Embroidered, P: All Over Print - Digit # 4 in color code</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'color_pattern'); ?>
		<?php echo $form->textField($model,'color_pattern',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'color_pattern'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'pattern_desc_e'); ?>
		<?php echo $form->textField($model,'pattern_desc_e',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'pattern_desc_e'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'pattern_desc_a'); ?>
		<?php echo $form->textField($model,'pattern_desc_a',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'pattern_desc_a'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->