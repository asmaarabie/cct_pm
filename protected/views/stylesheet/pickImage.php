<?php 
$this->breadcrumbs=array(
	'Stylesheets'=>array('index'),
	$model->style_code." - ".$model->formatSeasons,
	'Export to PDF'
);
?>
<div class="form">

<?php 
$this->layout='//layouts/column1';
$form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-pic-image',
)); ?>

	<p class="note">Select one of the images for the print view</p>
	<div class="row">
		<?php
			foreach ($images as $image) {
				$data[$image->ss_img_id] = 
				CHtml::image(Yii::app()->request->baseUrl.Yii::app()->params["styleSheetImagesUploadUrl"].$image->img_path,
									'to', array('width'=> '150px'));
			}
			
			// Select the first image by default
			$select =$images[0]->ss_img_id;
			echo CHtml::radioButtonList('selected_pic', $select, $data, array(
				'labelOptions'=>array('style'=>'display:inline; margin: 10px; text-align: center;'), 
				'separator'=>''));
		?>
	</div>
	<div class="row buttons" style="float:right">
		<?php 
			echo CHtml::submitButton('Proceed > ');
		?>
	
	</div>
	<div style="clear:both"></div>
<?php $this->endWidget(); ?>

</div><!-- form -->