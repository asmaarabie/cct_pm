<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'dcssize-scale-form',
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
		<?php //echo $form->labelEx($model,'DCS_size_id'); ?>
		<?php //echo $form->textField($model,'DCS_size_id',array('size'=>10,'maxlength'=>10)); ?>
		<?php //echo $form->error($model,'DCS_size_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'size_scale'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'size_scale',
		'model'=>$model,
		//'value'=> ($model->isNewRecord)? "": "lll",
        'sourceUrl'=> '?r=size/getSizeScaleNumAjax',
 		//'cssFile'=>false,
        'htmlOptions'=>array(
			'placeholder'=>'scale',
			'minLength'=>'1',
			'maxlength'=>5,
			'size'=>5),
		
		'options'=>array(
			'showAnim'=>'fold'),
         )); ?>
		<?php echo $form->error($model,'size_scale'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'size_fulldept'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'size_fulldept',
		'model'=>$model,
        'sourceUrl'=> '?r=dCSName/getDCSAjax',
        'htmlOptions'=>array(
			'placeholder'=>'Dept. name',
			'minLength'=>'1',
			'maxlength'=>9,
			'size'=>9),
		
		'options'=>array(
			'showAnim'=>'fold'),
         )); ?>
		<?php echo $form->error($model,'size_fulldept'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'size_country_id'); ?>
		<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'size_country_id',
		'model'=>$model,
        'sourceUrl'=> '?r=dCSName/getCountryAjax',
        'htmlOptions'=>array(
			'placeholder'=>'Country',
			'minLength'=>'1',
			'maxlength'=>5,
			'size'=>5),
		
		'options'=>array(
			'showAnim'=>'fold'),
         )); ?>
		<?php echo $form->error($model,'size_country_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->