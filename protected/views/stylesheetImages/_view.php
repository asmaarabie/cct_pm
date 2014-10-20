<?php
/* @var $this StylesheetImagesController */
/* @var $data StylesheetImages */
?>

<div class="view">

	<div style="float:left;">
	
		<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
		<?php echo CHtml::link($widget->ss_model->style_code, array('stylesheet/view', 'id'=>$widget->ss_model->ss_id)); ?>
		<br />
		<?php echo CHtml::submitButton('Delete', 
			array('#','submit'=>array('delete','id'=>$data->ss_img_id, 'ss_id'=> $widget->ss_model->ss_id),'confirm'=>'Are you sure you want to delete this item?')); ?>
		<br />
		
	</div>
	
	<div style="float:right;">
		<?php 
		echo CHtml::image(
				Yii::app()->request->baseUrl.Yii::app()->params["styleSheetImagesUploadUrl"].$data->img_path,
				$widget->ss_model->style_code. " ". $data->img_path . " image",
					array ("width" => "200px")); ?>
		<br />
	</div>
	
	<div style="clear: both"></div>
</div>