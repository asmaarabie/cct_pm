<?php
/* @var $this OperationController */
/* @var $model Operation */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'operation-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'op_name'); ?>
		<?php echo $form->textField($model,'op_name',array('size'=>40,'maxlength'=>40, 'placeholder'=>"createStylesheet")); ?>
		<?php echo $form->error($model,'op_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'operation'); ?>
		<?php echo $form->textField($model,'operation',array('size'=>40,'maxlength'=>40, 'placeholder'=>"Create Stylesheet")); ?>
		<?php echo $form->error($model,'operation'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->