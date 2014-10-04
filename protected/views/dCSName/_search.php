<?php
/* @var $this DCSNameController */
/* @var $model DCSName */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'dcs_id'); ?>
		<?php echo $form->textField($model,'dcs_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fulldept'); ?>
		<?php echo $form->textField($model,'fulldept',array('size'=>9,'maxlength'=>9)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'country_id'); ?>
		<?php echo $form->textField($model,'country_id',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'dcs_name'); ?>
		<?php echo $form->textField($model,'dcs_name',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->