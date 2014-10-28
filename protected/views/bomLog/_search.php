<?php
/* @var $this BomLogController */
/* @var $model BomLog */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'bom_log_id'); ?>
		<?php echo $form->textField($model,'bom_log_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'bom_id'); ?>
		<?php echo $form->textField($model,'bom_id'); ?>
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

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->