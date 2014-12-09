<?php
/* @var $this ColorCodeController */
/* @var $model ColorCode */
/* @var $form CActiveForm */
Yii::import('application.controllers.ColorController');
Yii::import('application.controllers.ColorShadowController');
Yii::import('application.controllers.ColorPatternController');
Yii::import('application.controllers.ColorShapeController');
$colors = ColorController::getColors();
$shadows = ColorShadowController::getShadows();
$patterns = ColorPatternController::getPatterns();
$shapes = ColorShapeController::getShapes();
/*
Yii::app()->clientScript->registerScript ("Color#color-autocomplete", "
		$('#ColorCode_color').autocomplete().data( 'autocomplete' )._renderItem = function( ul, item ) {
		    return $('<li></li>')
		        .data('item.autocomplete', item)
		        .append('<a><img height=10px src=\"' + item.img + '\" alt=\"' + item.label+ '\" />' + '\t'+  item.label +'</a>')
		        .appendTo(ul);
		};
		");
*/
Yii::app()->clientScript->registerScript ("updateColorCode", "
		var length = ' ';
		var color = '  ';
		var shape = ' ';
		var shadow = ' ';
		var pattern = ' ';

		$('#ColorCode_color').change(function() {
			color = $(this).val();
			$('#ColorCode_color_code').text(color+shadow+pattern+length+shape);
		});

		/*
		$('#ColorCode_length').change(function() {
			length = $(this).val();
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});
		*/
		$('#ColorCode_shape').change(function() {
			shape = $(this).val();
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});

		$('#ColorCode_shadow').change(function() {
			shadow = $(this).val();
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});

		$('#ColorCode_pattern').change(function() {
			pattern = $(this).val();
			$('#ColorCode_color_code').val(color+shadow+pattern+length+shape);
		});


");
?>
	<?php 
	$color_sel =''; $shape_sel=''; $shadow_sel=''; $pattern_sel = '';
	if ($model->color)
		$color_sel = $model->color0->color_id;
	if ($model->shadow && $model->shadow != ' ')
		$shadow_sel = $model->shadow0->color_shadow;
	if ($model->shape && $model->shape != ' ')
		$shape_sel = $model->shape0->color_shape;
	if ($model->pattern && $model->pattern != ' ')
		$pattern_sel = $model->pattern0->color_pattern;
	
	?>
	
	<div class="row"  style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'color'); ?>
		<?php echo $form->dropDownList($model, "color", $colors, array('empty' => "select color", "class"=>"miniform-dd", 
				'options'=>array($color_sel=>array('selected'=>true)))); ?>
	</div>

	<div class="row"  style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'shadow'); ?>
		<?php echo $form->dropDownList($model, "shadow", $shadows, array('empty' => "select shadow", "class"=>"miniform-dd", 
				'options'=>array($shadow_sel=>array('selected'=>true)))); ?>
	</div>
	
	<div class="row"  style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'pattern'); ?>
		<?php echo $form->dropDownList($model, "pattern", $patterns, array('empty' => "select pattern", "class"=>"miniform-dd", 
				'options'=>array($pattern_sel=>array('selected'=>true)))); ?>
	</div>

	<div class="row"  style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'shape'); ?>
		<?php echo $form->dropDownList($model, "shape", $shapes, array('empty' => "select shape", "class"=>"miniform-dd", 
				'options'=>array($shape_sel=>array('selected'=>true)))); ?>
	</div>

	<div class="row"  style="float:left; margin-right: 20px">
		<?php //echo $form->labelEx($model,'color_serial'); ?>
		<?php //echo $form->dropDownList($model,'color_serial', array()); ?>
		<?php //echo $form->error($model,'color_serial'); ?>
		
		
	</div>
	<div class="row"  style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'color_code'); ?>
		<?php echo $form->textField($model,'color_code',array('size'=>8,'maxlength'=>8, 'readonly'=> true, 'class'=>'read-only')); ?>
	</div>
	
	
	<div style="clear: both;"></div>
	
	<div class="row">
		<?php if (!isset($noIncrement)) :?>
		<?php echo CHtml::label('Increment serial if the color code exists?', 'increment_label'); ?>
		<?php echo CHtml::checkBox('box', false);?>
		<?php endif;?>
	</div>
	
	<?php echo $form->error($model,'color_code'); ?>
	<?php echo $form->error($model,'color'); ?>
	<?php echo $form->error($model,'shadow'); ?>
	<?php echo $form->error($model,'pattern'); ?>
	<?php echo $form->error($model,'length'); ?>
	<?php echo $form->error($model,'shape'); ?>
