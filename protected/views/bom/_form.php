<?php
/* @var $this BomController */
/* @var $model Bom */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'bom-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
		<?php echo $form->error($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_desc'); ?>
		<?php echo $form->textField($model,'item_desc',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'item_desc'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_placement'); ?>
		<?php echo $form->textField($model,'item_placement',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'item_placement'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fulldept'); ?>
		<?php echo $form->textField($model,'fulldept',array('size'=>9,'maxlength'=>9)); ?>
		<?php echo $form->error($model,'fulldept'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_qty'); ?>
		<?php echo $form->textField($model,'item_qty'); ?>
		<?php echo $form->error($model,'item_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_consumption'); ?>
		<?php echo $form->textField($model,'item_consumption',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'item_consumption'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_increase'); ?>
		<?php echo $form->textField($model,'item_increase'); ?>
		<?php echo $form->error($model,'item_increase'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'pono'); ?>
		<?php echo $form->textField($model,'pono'); ?>
		<?php echo $form->error($model,'pono'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'countryid'); ?>
		<?php echo $form->textField($model,'countryid',array('size'=>5,'maxlength'=>5)); ?>
		<?php echo $form->error($model,'countryid'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'itemno'); ?>
		<?php echo $form->textField($model,'itemno'); ?>
		<?php echo $form->error($model,'itemno'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->