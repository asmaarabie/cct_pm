<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */
/* @var $form CActiveForm */

Yii::app()->clientScript->registerScript ("Color#color-autocomplete", "
		$('#ColorCode_color').autocomplete().data( 'autocomplete' )._renderItem = function( ul, item ) {
		    return $('<li></li>')
		        .data('item.autocomplete', item)
		        .append('<a><img height=10px src=\"' + item.img + '\" alt=\"' + item.label+ '\" />' + '\t'+  item.label +'</a>')
		        .appendTo(ul);
		};
		");
Yii::app()->clientScript->registerScript ("updateColorCode", "
		if($.trim($('#ColorCode_color_code').val()) == '') {
			var color = '--' ;
			var shadow = '-' ;
			var pattern = '-' ;
			var length = '-' ;
			var shape = '-' ;
			
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);		
		}
		
		
		$('#ColorCode_color').change(function() {
			if($.trim($('#ColorCode_color').val()) !== '')
				color = ($('#ColorCode_color').val().length < 2)? $('#ColorCode_color').val()+'-' : $('#ColorCode_color').val(); else color = '--';
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_length').change(function() {
			if($.trim($('#ColorCode_length').val()) !== '')
				length = $('#ColorCode_length').val(); else length = '-';
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_shape').change(function() {
			if($.trim($('#ColorCode_shape').val()) !== '')
				shape = $('#ColorCode_shape').val(); else shape = '-';
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_shadow').change(function() {
			if($.trim($('#ColorCode_shadow').val()) !== '')
				shadow = $('#ColorCode_shadow').val(); else shadow = '-';
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_pattern').change(function() {
			if($.trim($('#ColorCode_pattern').val()) !== '')
				pattern = $('#ColorCode_pattern').val(); else pattern = '-';
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		
		
		");
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'color-code-form',
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
		<?php echo $form->labelEx($model,'color_code'); ?>
		<?php echo $form->textField($model,'color_code',array('size'=>8,'maxlength'=>8, 'readonly'=> true)); ?>
		<?php echo $form->error($model,'color_code'); ?>
	</div>
	
	
	<div class="row">
		<?php echo $form->labelEx($model,'color'); ?>
		
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'color',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getColorAjax',
        'htmlOptions'=>array(
			'placeholder'=>'color id',
			'minLength'=>'1',
			'size'=>2
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		<?php echo $form->error($model,'color'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shadow'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'shadow',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=shadow',
        'htmlOptions'=>array(
			'minLength'=>'1',
			'size'=>1
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		<?php echo $form->error($model,'shadow'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'pattern'); ?>
		
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'pattern',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=pattern',
        'htmlOptions'=>array(
			'minLength'=>'1',
			'size'=>1
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		<?php echo $form->error($model,'pattern'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'length'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'length',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=length',
        'htmlOptions'=>array(
			'minLength'=>'1',
			'size'=>1
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		<?php echo $form->error($model,'length'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shape'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'shape',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=shape',
        'htmlOptions'=>array(
			'minLength'=>'1',
			'size'=>1
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
		));

		?>
		<?php echo $form->error($model,'shape'); ?>
	</div>

	<div class="row">
		<?php //echo $form->labelEx($model,'color_serial'); ?>
		<?php //echo $form->dropDownList($model,'color_serial', array()); ?>
		<?php //echo $form->error($model,'color_serial'); ?>
		
		
	</div>
	<div class="row">
		<?php if ($model->isNewRecord) {
				echo CHtml::checkBox('box', false); 
				echo CHtml::label('Increment serial if the color code exists?', 'increment_label'); 
			}
		?>
		
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->