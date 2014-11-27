<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'subclassid'); ?>
		<?php echo $form->textField($model,'subclassid',array('size'=>3,'maxlength'=>3)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'subclass_name'); ?>
		<?php echo $form->textField($model,'subclass_name',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'countryid'); ?>
		<?php echo $form->textField($model,'countryid',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->