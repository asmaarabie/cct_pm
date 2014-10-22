<?php
/* @var $this GroupController */
/* @var $model Group */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'group-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	<?php if(Yii::app()->user->hasFlash('group_operation')) { ?>
		<div class="flash-error">
			<?php echo Yii::app()->user->getFlash('group_operation'); ?>
		</div>
	<?php } ?>
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'group_name'); ?>
		<?php echo $form->textField($model,'group_name',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'group_name'); ?>
	</div>
	
	<div class="row">
	<?php 
		// $operations array in case of a new record is an array of Operation::model() 
		// $operations array in case of an existing record is an array of GroupOperations::model(), so it has a checked property
		
		foreach ( $operations as $operation) {
			echo "<span style ='float:left; margin-right:10px'>".CHtml::checkBox('box'.$operation->op_name, $model->isNewRecord? false:$operation->checked)."</span>";
			echo "<span style ='float:left'>".CHtml::label (($model->isNewRecord)? $operation->operation: $operation->opName->operation, 'label_box'.$operation->op_name)."</span>";
			echo "<div style='clear:both'> </div> ";
			
		}
	?>
	</div>
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->