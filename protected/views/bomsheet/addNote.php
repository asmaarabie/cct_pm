<?php
/* @var $this BomController */
/* @var $model StylesheetLog */
/* @var $form CActiveForm */
?>

<?php
$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom'=>array('index', 'ss_id'=>$ss_model->ss_id),
	'Add Note'
);

?>

<h1>Add Note</h1>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-log-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	
	<div class="row">
		<?php echo $form->labelEx($model,'action_comment'); ?>
		<?php echo $form->textArea($model,'action_comment',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'action_comment'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->