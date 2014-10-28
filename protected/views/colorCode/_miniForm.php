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

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'color_code'); ?>
		<?php echo $form->textField($model,'color_code',array('size'=>10,'maxlength'=>8, 'readonly'=> true)); ?>
	</div>
	
	
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'color'); ?>
		
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'color',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getColorAjax',
        'htmlOptions'=>array(
			'placeholder'=>'White',
			'minLength'=>'1',
			'size'=>10
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'shadow'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'shadow',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=shadow',
        'htmlOptions'=>array(
			'placeholder'=>'Light',
			'minLength'=>'1',
			'size'=>10
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		
	</div>
	
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'pattern'); ?>
		
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'pattern',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=pattern',
        'htmlOptions'=>array(
			'placeholder'=>'Embroidered',
			'minLength'=>'1',
			'size'=>10
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'length'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'length',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=length',
        'htmlOptions'=>array(
			'placeholder'=>'suit small',
			'minLength'=>'1',
			'size'=>10
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
         ));

		?>
		
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'shape'); ?>
		<?php 
		$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
		'attribute' => 'shape',
		'model'=>$model,
        'sourceUrl'=> '?r=colorCode/getParamAjax&param=shape',
        'htmlOptions'=>array(
			'placeholder'=>'Small',
			'minLength'=>'1',
			'size'=>10
			),
		'options'=>array(
			'showAnim'=>'fold',
			),
		));

		?>
		
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
