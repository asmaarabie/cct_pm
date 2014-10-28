<?php
/*
Yii::app()->clientScript->registerScript ("Color#color-autocomplete", "
		$('#ColorCode_{$i}_color').autocomplete().data( 'autocomplete' )._renderItem = function( ul, item ) {
		    return $('<li></li>')
		        .data('item.autocomplete', item)
		        .append('<a><img height=10px src=\"' + item.img + '\" alt=\"' + item.label+ '\" />' + '\t'+  item.label +'</a>')
		        .appendTo(ul);
		};
		");
Yii::app()->clientScript->registerScript ("updateColorCode{$i}", "
		if($.trim($('#ColorCode_{$i}_color_code').val()) == '') {
			var color = '--' ;
			var shadow = '-' ;
			var pattern = '-' ;
			var length = '-' ;
			var shape = '-' ;
			
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);		
		}
		
		
		$('#ColorCode_{$i}_color').on('change',function() {
			if($.trim($('#ColorCode_{$i}_color').val()) !== '')
				color = ($('#ColorCode_{$i}_color').val().length < 2)? $('#ColorCode_{$i}_color').val()+'-' : $('#ColorCode_{$i}_color').val(); else color = '--';
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_{$i}_length').on('change',function() {
			if($.trim($('#ColorCode_{$i}_length').val()) !== '')
				length = $('#ColorCode_{$i}_length').val(); else length = '-';
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_{$i}_shape').on('change',function() {
			if($.trim($('#ColorCode_{$i}_shape').val()) !== '')
				shape = $('#ColorCode_{$i}_shape').val(); else shape = '-';
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_{$i}_shadow').on('change',function() {
			if($.trim($('#ColorCode_{$i}_shadow').val()) !== '')
				shadow = $('#ColorCode_{$i}_shadow').val(); else shadow = '-';
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);
		});
		
		$('#ColorCode_{$i}_pattern').on('change', '#ColorCode_{$i}_pattern', function() {
			if($.trim($('#ColorCode_{$i}_pattern').val()) !== '')
				pattern = $('#ColorCode_{$i}_pattern').val(); else pattern = '-';
			$('#ColorCode_{$i}_color_code').val(color+shadow+pattern+length+shape);
		});
		
		
		");
		*/
Yii::import('application.controllers.ColorController');
Yii::import('application.controllers.ColorShadowController');
Yii::import('application.controllers.ColorPatternController');
Yii::import('application.controllers.ColorLengthController');
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
		<?php echo CHtml::activeLabelEx($cc_model,'length'); ?>
		<?php 
		$lengths = ColorLengthController::getLengths();
		echo CHtml::activeDropDownList($cc_model, "[$i]length", $lengths, array('empty' => "select length", "class"=>"miniform-dd"));
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
