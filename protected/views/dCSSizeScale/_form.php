<?php
/* @var $this DCSSizeScaleController */
/* @var $model DCSSizeScale */
/* @var $form CActiveForm */
Yii::import('application.controllers.CountryController');
$countries = CountryController::getCountries();
$depts = DCSSizeScaleController::actionGetCountryDepts($model->size_country_id);
$sizeScales = Size::model()->findAll();
$sizeScalesList = array();
foreach ($sizeScales as $scale) 
	$sizeScalesList[$scale->scale_number] = $scale->scale_name;
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'dcssize-scale-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	
	<?php echo $form->labelEx($model,'size_country_id'); ?>
        <?php echo $form->dropDownList($model, "size_country_id",$countries, array(
        		'empty' => "Select Country", 
        		"class"=>"miniform-dd",
        		'ajax' => array(
					'type'=>'POST',
					'url'=>CController::createUrl('getCountryDepts'),
					'update'=>"#DCSSizeScale_size_fulldept",
			        )
        ));?>
     <?php echo $form->error($model,'size_country_id'); ?>
	
	 <div class="row">
        <?php echo $form->labelEx($model,'size_fulldept'); ?>
        <?php echo $form->dropDownList($model, 'size_fulldept', $depts, array('empty' => "Select Subclass", "width"=>"100px"));?>
        <?php echo $form->error($model,'size_fulldept'); ?>
    </div>
    
     <div class="row">
        <?php echo $form->labelEx($model,'size_scale'); ?>
        <?php echo $form->dropDownList($model, 'size_scale', $sizeScalesList, array('empty' => "Select Subclass", "width"=>"100px"));?>
        <?php echo $form->error($model,'size_scale'); ?>
    </div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->