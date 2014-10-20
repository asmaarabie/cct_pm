<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'ss_bom_id'); ?>
		<?php echo $form->textField($model,'ss_bom_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'dcs_name'); ?>
		<?php echo $form->textField($model,'dcs_name',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'dept_id'); ?>
		<?php echo $form->textField($model,'dept_id',array('size'=>3,'maxlength'=>3)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'class_id'); ?>
		<?php echo $form->textField($model,'class_id',array('size'=>3,'maxlength'=>3)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'subclass_id'); ?>
		<?php echo $form->textField($model,'subclass_id',array('size'=>3,'maxlength'=>3)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_color_id'); ?>
		<?php echo $form->textField($model,'item_color_id',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_desc'); ?>
		<?php echo $form->textField($model,'item_desc',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_cons'); ?>
		<?php echo $form->textField($model,'item_cons',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'item_placement'); ?>
		<?php echo $form->textField($model,'item_placement',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'countryid'); ?>
		<?php echo $form->textField($model,'countryid',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->