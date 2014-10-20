<?php
/* @var $this StylesheetController */
/* @var $data Stylesheet */
?>

<div class ="img-container">
	<?php 
	echo CHtml::image(
			Yii::app()->request->baseUrl.Yii::app()->params["styleSheetImagesUploadUrl"].$data->img_path,
			$data->img_path,
			array ("width" => "150px")); ?>
</div>