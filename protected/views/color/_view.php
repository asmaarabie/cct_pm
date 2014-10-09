<?php
/* @var $this ColorController */
/* @var $data Color */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_id), array('view', 'id'=>$data->color_id)); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('color_desc_e')); ?>:</b>
	<?php echo CHtml::encode($data->color_desc_e); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_desc_a')); ?>:</b>
	<?php echo CHtml::encode($data->color_desc_a); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_img')); ?>:</b>
	<?php echo CHtml::image(
			Yii::app()->request->baseUrl.Yii::app()->params["colorUploadUrl"].$data->color_img,
			$data->color_id."color",
			array ("height"=>"10px", "width" => "40px")); ?>
	<br />

	
</div>