<?php
/* @var $this ColorShadowController */
/* @var $model ColorShadow */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'color_shadow'); ?>
		<?php echo $form->textField($model,'color_shadow',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	
	<div class="row">
		<?php echo $form->label($model,'shadow_desc_e'); ?>
		<?php echo $form->textField($model,'shadow_desc_e',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'shadow_desc_a'); ?>
		<?php echo $form->textField($model,'shadow_desc_a',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->