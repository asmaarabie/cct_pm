<?php
/* @var $this MarkerController */
/* @var $model Marker */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'marker_id'); ?>
		<?php echo $form->textField($model,'marker_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'width'); ?>
		<?php echo $form->textField($model,'width'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'length'); ?>
		<?php echo $form->textField($model,'length'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'utilization'); ?>
		<?php echo $form->textField($model,'utilization'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'t_size'); ?>
		<?php echo $form->textField($model,'t_size'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ratio'); ?>
		<?php echo $form->textField($model,'ratio',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'marker_name'); ?>
		<?php echo $form->textField($model,'marker_name',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'owner'); ?>
		<?php echo $form->textField($model,'owner'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->