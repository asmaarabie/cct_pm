<?php
/* @var $this StylesheetImagesController */
/* @var $model StylesheetImages */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'ss_img_id'); ?>
		<?php echo $form->textField($model,'ss_img_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ss_id'); ?>
		<?php echo $form->textField($model,'ss_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'img_path'); ?>
		<?php echo $form->textField($model,'img_path',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->