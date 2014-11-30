<?php
/* @var $this IsoHeaderController */
/* @var $model IsoHeader */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'iso-header-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'header_code'); ?>
		<?php echo $form->textField($model,'header_code',array('size'=>15,'maxlength'=>15)); ?>
		<?php echo $form->error($model,'header_code'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'version'); ?>
		<?php echo $form->textField($model,'version'); ?>
		<?php echo $form->error($model,'version'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'date'); ?>
		<?php 
		$this->widget(
				'ext.jui.EJuiDateTimePicker',
				array(
						'model'     => $model,
						'attribute' => 'date',
						'language'=> 'en',//default Yii::app()->language
						'mode'    => 'date',//'datetime' or 'time' ('datetime' default)
						'options'   => array(
								'dateFormat' => 'yy/mm/dd',
								//'timeFormat' => '',//'hh:mm tt' default
						),
				)
		);
		?>
		<?php echo $form->error($model,'date'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'def'); ?>
		<?php echo $form->dropDownList($model, 'def', 
              array('0' => 'No', '1' => 'Yes')); ?>
		<?php echo $form->error($model,'def'); ?>
	</div>
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->