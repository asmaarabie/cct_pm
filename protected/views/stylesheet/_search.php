<?php
/* @var $this StylesheetController */
/* @var $model Stylesheet */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'country_id'); ?>
		<?php echo $form->textField($model,'country_id',array('size'=>5,'maxlength'=>5)); ?>
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
		<?php echo $form->label($model,'season'); ?>
		<?php echo $form->textField($model,'season',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'year'); ?>
		<?php echo $form->textField($model,'year',array('size'=>4,'maxlength'=>4)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'pono'); ?>
		<?php echo $form->textField($model,'pono',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'dcs_notes'); ?>
		<?php echo $form->textField($model,'dcs_notes',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'style_code'); ?>
		<?php echo $form->textField($model,'style_code',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'stylesheet_note'); ?>
		<?php echo $form->textArea($model,'stylesheet_note',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fabric'); ?>
		<?php echo $form->textField($model,'fabric',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'scale'); ?>
		<?php echo $form->textField($model,'scale',array('size'=>10,'maxlength'=>10)); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'sizes'); ?>
		<?php echo $form->textField($model,'sizes',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->