<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-color-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>
<p class="note">Fields with <span class="required">*</span> are required.</p>
	<?php 
	if ($model->isNewRecord) 
		echo $form->errorSummary(array ($model, $cc_model));
	else 
		echo $form->errorSummary($model); ?>
	
	<div class="row">
		<?php  //if ($model->isNewRecord) 
		{
			Yii::import('application.controllers.ColorCodeController');
			ColorCodeController::renderPartial('/colorCode/_miniForm', array('model'=>$cc_model, 'form' => $form)); 
		}
		?>
		
	</div>
		
	<div class="row">
		<?php echo $form->labelEx($model,'print'); ?>
		<?php echo $form->checkBox($model, 'print');  ?>
		<?php echo $form->error($model,'print'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'emb'); ?>
		<?php echo $form->checkBox($model, 'emb');  ?>
		<?php echo $form->error($model,'emb'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'place'); ?>
		<?php echo $form->textField($model,'place',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'place'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'code'); ?>
		<?php echo $form->textField($model,'code',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'code'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ss_color_desc'); ?>
		<?php echo $form->textField($model,'ss_color_desc',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'ss_color_desc'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->