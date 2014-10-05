<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'subclass-name-form',
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
		<?php echo $form->labelEx($model,'subclassid'); ?>
		<?php 
		
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
        'attribute' => 'subclassid',
		'model'=>$model,
		'value'=>$model->subclassid,
        'sourceUrl'=> '?r=subclassName/getSubclassesAjax',
 		//'cssFile'=>false,
        'htmlOptions'=>array(
			'placeholder'=>'id',
			'minLength'=>'1',
			'maxlength'=>3,
			'size'=>3),
		
		'options'=>array(
			'showAnim'=>'fold'),
         ));
		?>
		<?php //echo $form->textField($model,'subclassid',array('size'=>3,'maxlength'=>3)); ?>
		<?php echo $form->error($model,'subclassid'); ?>
		
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'subclass_name'); ?>
		<?php echo $form->textField($model,'subclass_name',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'subclass_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->