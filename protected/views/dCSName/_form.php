<?php
/* @var $this DCSNameController */
/* @var $model DCSName */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'dcsname-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
		
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'fulldept'); ?>
		<?php 
		
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'fulldept',
		'model'=>$model,
		//'value'=> ($model->isNewRecord)? "": "lll",
        'sourceUrl'=> '?r=dCSName/getDCSAjax',
 		//'cssFile'=>false,
        'htmlOptions'=>array(
			'placeholder'=>'Dept. name',
			'minLength'=>'1',
			'maxlength'=>8,
			'size'=>8),
		
		'options'=>array(
			'showAnim'=>'fold'),
         ));
		?>
		<?php echo $form->error($model,'fulldept'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'country_id'); ?>
		<?php 
		
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'country_id',
		'model'=>$model,
		//'value'=> ($model->isNewRecord)? "": $model->country->countrydesc,
        'sourceUrl'=> '?r=dCSName/getCountryAjax',
 		//'cssFile'=>false,
        'htmlOptions'=>array(
			'placeholder'=>'Country',
			'minLength'=>'1',
			'maxlength'=>5,
			'size'=>5),
		
		'options'=>array(
			'showAnim'=>'fold'),
         ));
		?>
		<?php echo $form->error($model,'country_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'dcs_name'); ?>
		<?php echo $form->textField($model,'dcs_name',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'dcs_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->