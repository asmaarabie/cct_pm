<?php
/* @var $this StylesheetColorController */
/* @var $model StylesheetColor */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'ss_color_id'); ?>
		<?php echo $form->textField($model,'ss_color_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'color_code'); ?>
		<?php echo $form->textField($model,'color_code',array('size'=>2,'maxlength'=>2)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'print'); ?>
		<?php echo $form->textField($model,'print'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'emb'); ?>
		<?php echo $form->textField($model,'emb'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'place'); ?>
		<?php echo $form->textField($model,'place',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'code'); ?>
		<?php echo $form->textField($model,'code',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_color_desc'); ?>
		<?php echo $form->textField($model,'ss_color_desc',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->