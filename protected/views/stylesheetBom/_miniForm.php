<?php
/**
 * Saved for later enhancement (multi-record insertion)
 */
/*
Yii::app()->clientScript->registerScript ("Color#color-autocomplete", "
		$('#ColorCode_{$i}_color').autocomplete().data( 'autocomplete' )._renderItem = function( ul, item ) {
		    return $('<li></li>')
		        .data('item.autocomplete', item)
		        .append('<a><img height=10px src=\"' + item.img + '\" alt=\"' + item.label+ '\" />' + '\t'+  item.label +'</a>')
		        .appendTo(ul);
		};
		");
		
Yii::import('application.controllers.ColorController');
Yii::import('application.controllers.ColorShadowController');
Yii::import('application.controllers.ColorPatternController');
Yii::import('application.controllers.ColorShapeController');
?>
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo CHtml::activeLabelEx($cc_model,'color'); ?>
		<?php 
		$colors = ColorController::getColors();
		echo CHtml::activeDropDownList($cc_model, "[$i]color", $colors, array('empty' => "select color", "class"=>"miniform-dd"));
		?>
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo CHtml::activeLabelEx($cc_model,'shadow'); ?>
		<?php 
		$shadows = ColorShadowController::getShadows();
		echo CHtml::activeDropDownList($cc_model, "[$i]shadow", $shadows, array('empty' => "select shadow", "class"=>"miniform-dd"));
		?>
	</div>
	
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo CHtml::activeLabelEx($cc_model,'pattern'); ?>
		<?php 
		$patterns = ColorPatternController::getPatterns();
		echo CHtml::activeDropDownList($cc_model, "[$i]pattern", $patterns, array('empty' => "select pattern", "class"=>"miniform-dd"));
		?>
	</div>
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo CHtml::activeLabelEx($cc_model,'shape'); ?>
		<?php 
		$shapes = ColorShapeController::getShapes();
		echo CHtml::activeDropDownList($cc_model, "[$i]shape", $shapes, array('empty' => "select shape", "class"=>"miniform-dd"));
		?>
		
	</div>

	<div style="clear: both;"></div>
	
	<?php echo CHtml::error($cc_model,"[$i]color_code"); ?>
	<?php echo CHtml::error($cc_model,"[$i]color"); ?>
	<?php echo CHtml::error($cc_model,"[$i]shadow"); ?>
	<?php echo CHtml::error($cc_model,"[$i]pattern"); ?>
	<?php echo CHtml::error($cc_model,"[$i]length"); ?>
	<?php echo CHtml::error($cc_model,"[$i]shape"); ?>
	*/
?>
