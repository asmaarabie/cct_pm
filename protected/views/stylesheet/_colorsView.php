<?php
/* @var $this StylesheetColorController */
/* @var $data StylesheetColor */
?>

<div class ="img-container">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_code')); ?>:</b>
	<?php echo CHtml::image (Yii::app()->request->baseUrl.Yii::app()->params["colorUploadUrl"].$data->colorCode->color0->color_img, "color", array ("height"=>"10px", "width" => "40px", "border"=>"1px solid"));
	echo CHtml::link("  ".$data->color_code, array ('ColorCode/view', "id"=> $data->color_code)); 
	 
	?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('print')); ?>:</b>
	<?php 
	if ($data->print)
		echo "&#10004";
	else 
		echo "&#10006";
	?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emb')); ?>:</b>
	<?php 
	
	if ($data->emb)
		echo "&#10004";
	else 
		echo "&#10006";
	?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('place')); ?>:</b>
	<?php echo ($data->place==null) ? "<span class = 'usr-def-null'>Not Set</span>": $data->place; ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('code')); ?>:</b>
	<?php echo ($data->code==null) ? "<span class = 'usr-def-null'>Not Set</span>": $data->code; ?>
	<br />
 
	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_color_desc')); ?>:</b>
	<?php echo ($data->ss_color_desc==null) ? "<span class = 'usr-def-null'>Not Set</span>": $data->ss_color_desc; ?>
	<br />
	
</div>