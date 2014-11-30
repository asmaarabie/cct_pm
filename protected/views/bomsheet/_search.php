<?php
/* @var $this BomsheetController */
/* @var $model Bomsheet */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'bs_id'); ?>
		<?php echo $form->textField($model,'bs_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'pono'); ?>
		<?php echo $form->textField($model,'pono',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'user_id'); ?>
		<?php echo $form->textField($model,'user_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->