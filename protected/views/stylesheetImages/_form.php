<?php
/* @var $this StylesheetImagesController */
/* @var $model StylesheetImages */
/* @var $form CActiveForm */
?>
<?php if(Yii::app()->user->hasFlash('ss_img_create')) { ?>
<div class="flash-error">
	<?php echo Yii::app()->user->getFlash('ss_img_create'); ?>
</div>
<?php } ?>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-images-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
	'htmlOptions' => array('enctype' => 'multipart/form-data'), // ADD THIS
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'img_path'); ?>
		<?php echo $form->fileField($model,'img_path'); ?>
		<?php //echo $form->error($model,'img_path'); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->