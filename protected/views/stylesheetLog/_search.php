<?php
/* @var $this StylesheetLogController */
/* @var $model StylesheetLog */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'ss_log_id'); ?>
		<?php echo $form->textField($model,'ss_log_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'stylesheet_id'); ?>
		<?php echo $form->textField($model,'stylesheet_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'action_time_stamp'); ?>
		<?php echo $form->textField($model,'action_time_stamp'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'action_type'); ?>
		<?php echo $form->textField($model,'action_type',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'action_comment'); ?>
		<?php echo $form->textArea($model,'action_comment',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'user'); ?>
		<?php echo $form->textField($model,'user'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->