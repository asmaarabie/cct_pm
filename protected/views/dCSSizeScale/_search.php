<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'DCS_size_id'); ?>
		<?php echo $form->textField($model,'DCS_size_id',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'size_scale'); ?>
		<?php echo $form->textField($model,'size_scale',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'size_fulldept'); ?>
		<?php echo $form->textField($model,'size_fulldept',array('size'=>9,'maxlength'=>9)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'size_country_id'); ?>
		<?php echo $form->textField($model,'size_country_id',array('size'=>5,'maxlength'=>5)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->