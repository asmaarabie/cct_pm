<?php
/* @var $this DepartmentNameController */
/* @var $model DepartmentName */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'dept_id'); ?>
		<?php echo $form->textField($model,'dept_id',array('size'=>3,'maxlength'=>3)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'dept_name'); ?>
		<?php echo $form->textField($model,'dept_name',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row">
		<?php echo $form->label($model,'counryid'); ?>
		<?php echo $form->textField($model,'countryid',array('size'=>40,'maxlength'=>40)); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->