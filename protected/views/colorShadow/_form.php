<?php
/* @var $this ColorShadowController */
/* @var $model ColorShadow */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-shadow-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	<br/>
	
	<p class="note">ex. L: light, N:Brown - Digit #3 in color code</p>
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'color_shadow'); ?>
		<?php echo $form->textField($model,'color_shadow',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'color_shadow'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'shadow_desc_e'); ?>
		<?php echo $form->textField($model,'shadow_desc_e',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'shadow_desc_e'); ?>
	</div>
	
	
	<div class="row">
		<?php echo $form->labelEx($model,'shadow_desc_a'); ?>
		<?php echo $form->textField($model,'shadow_desc_a',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'shadow_desc_a'); ?>
	</div>

	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->