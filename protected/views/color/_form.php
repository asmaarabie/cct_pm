<?php
/* @var $this ColorController */
/* @var $model Color */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
	'htmlOptions' => array('enctype' => 'multipart/form-data'),
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'color_id'); ?>
		<?php echo $form->textField($model,'color_id',array('size'=>2,'maxlength'=>2)); ?>
		<?php echo $form->error($model,'color_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'color_desc_a'); ?>
		<?php echo $form->textField($model,'color_desc_a',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'color_desc_a'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'color_desc_e'); ?>
		<?php echo $form->textField($model,'color_desc_e',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'color_desc_e'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'color_img'); ?>
		<?php echo $form->fileField($model, 'color_img'); ?> 
		<?php 
		
		if($model->isNewRecord!='1') {
		?>
		<div>
		     <?php echo CHtml::image(Yii::app()->request->baseUrl.Yii::app()->params["colorUploadUrl"].$model->color_img,"image",array("width"=>200)); ?>
		</div> 
		<?php }?>
		<?php echo $form->error($model,'color_img'); ?>
	</div>

	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->