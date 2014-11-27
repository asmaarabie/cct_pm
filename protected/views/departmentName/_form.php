<?php
/* @var $this DepartmentNameController */
/* @var $model DepartmentName */
/* @var $form CActiveForm */
Yii::import('application.controllers.CountryController');
$countries = CountryController::getCountries();
$depts = DepartmentNameController::actionGetCountryDepts($model->countryid);
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'department-name-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	
	<div class="row">
        <?php echo $form->labelEx($model,'countryid'); ?>
        <?php echo $form->dropDownList($model, "countryid",$countries, array(
        		'empty' => "Select Country", 
        		"class"=>"miniform-dd",
        		'ajax' => array(
					'type'=>'POST',
					'url'=>CController::createUrl('getCountryDepts'),
					'update'=>"#DepartmentName_dept_id",
			        )
        ));?>
        <?php echo $form->error($model,'countryid'); ?>
    </div>
    
    <div class="row">
        <?php echo $form->labelEx($model,'dept_id'); ?>
        <?php echo $form->dropDownList($model, 'dept_id', $depts, array('empty' => "Select Department", "width"=>"100px"));?>
        <?php echo $form->error($model,'dept_id'); ?>
    </div>
   
	<div class="row">
		<?php echo $form->labelEx($model,'dept_name'); ?>
		<?php echo $form->textField($model,'dept_name',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'dept_name'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->