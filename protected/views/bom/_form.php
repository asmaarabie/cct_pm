<?php
/* @var $this BomController */
/* @var $model Bom */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'bom-form',
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

	
	<div class="row" style='border-radius: 5px; background: #EFEFEF; padding: 10px;'>
		
		<div>
			<?php echo $form->labelEx($model,'itemno'); ?>
			<?php echo $form->textField($model,'itemno', array('placeholder' => '4173'));?>
			<?php echo CHtml::ajaxLink('Get Item Info', array("bom/getItemInfo"),
			array('type' => 'POST', 'update' => '#bom-itemno-info')); ?>
			<?php echo $form->error($model,'itemno'); ?>
			
		</div>
		<div id="bom-itemno-info">
			
		</div>
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
		<?php echo $form->labelEx($model,'item_qty'); ?>
		<?php echo $form->textField($model,'item_qty'); ?>
		<?php echo $form->error($model,'item_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'item_consumption'); ?>
		<?php echo $form->textField($model,'item_consumption'); ?>
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