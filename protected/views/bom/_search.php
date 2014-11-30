<?php
/* @var $this BomController */
/* @var $model Bom */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'bom_id'); ?>
		<?php echo $form->textField($model,'bom_id'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'bs_id'); ?>
		<?php echo $form->textField($model,'bs_id'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_desc'); ?>
		<?php echo $form->textField($model,'item_desc',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_placement'); ?>
		<?php echo $form->textField($model,'item_placement',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fulldept'); ?>
		<?php echo $form->textField($model,'fulldept',array('size'=>9,'maxlength'=>9)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_qty'); ?>
		<?php echo $form->textField($model,'item_qty'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_consumption'); ?>
		<?php echo $form->textField($model,'item_consumption',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_increase'); ?>
		<?php echo $form->textField($model,'item_increase'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'countryid'); ?>
		<?php echo $form->textField($model,'countryid',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'itemno'); ?>
		<?php echo $form->textField($model,'itemno'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->