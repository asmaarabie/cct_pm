<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */
/* @var $form CActiveForm */
$_SESSION['count']=0;
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-bom-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php $form->errorSummary($cc_model); 
	$form->errorSummary($model)?>
	
	<div class = "bom-element-wrapper">
	<?php 
	foreach ($model as $i=>$r)
		$this->actionAddRecord($model[$i], $cc_model[$i]);
	?>
	</div>
	
	<div class="row">
	<?php echo CHtml::ajaxLink('Add additional', array("stylesheetBom/addRecord"),
			array('success' => 'function(html) {$(".bom-element-wrapper").append(html);}'));
	?>
	</div>
	
	<div class="row buttons" style="float:right">
	<?php echo CHtml::submitButton('Save'); ?>
	</div>
	<div style="clear:both;"></div>

<?php $this->endWidget(); ?>

</div><!-- form -->