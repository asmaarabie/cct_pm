<?php
/* @var $this SubclassNameController */
/* @var $model SubclassName */
/* @var $form CActiveForm */
Yii::import('application.controllers.CountryController');
$countries = CountryController::getCountries();
$subclasses = SubclassNameController::actionGetCountrySubclasses($model->countryid);
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'subclass-name-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>
	
	<div class="row">
	<?php echo $form->errorSummary($model); ?>

	    <?php echo $form->labelEx($model,'countryid'); ?>
        <?php echo $form->dropDownList($model, "countryid",$countries, array(
        		'empty' => "Select Country", 
        		"class"=>"miniform-dd",
        		'ajax' => array(
					'type'=>'POST',
					'url'=>CController::createUrl('getCountrySubclasses'),
					'update'=>"#SubclassName_subclassid",
			        )
        ));?>
        <?php echo $form->error($model,'countryid'); ?>
    </div>
    
    <div class="row">
        <?php echo $form->labelEx($model,'subclassid'); ?>
        <?php echo $form->dropDownList($model, 'subclassid', $subclasses, array('empty' => "Select Subclass", "width"=>"100px"));?>
        <?php echo $form->error($model,'subclassid'); ?>
    </div>
    
	<div class="row">
		<?php echo $form->labelEx($model,'subclass_name'); ?>
		<?php echo $form->textField($model,'subclass_name',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'subclass_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
