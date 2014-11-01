<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */
/* @var $form CActiveForm */
Yii::import('application.controllers.CountryController');
Yii::import('application.controllers.DepartmentController');
Yii::import('application.controllers.ColorController');
Yii::import('application.controllers.ColorShadowController');
Yii::import('application.controllers.ColorPatternController');
Yii::import('application.controllers.ColorLengthController');
Yii::import('application.controllers.ColorShapeController');
$countries = CountryController::getCountries();
$colors = ColorController::getColors();
$shadows = ColorShadowController::getShadows();
$patterns = ColorPatternController::getPatterns();
$lengths = ColorLengthController::getLengths();
$shapes = ColorShapeController::getShapes();
$depts = DepartmentController::getDepartments($model->countryid);

?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
    'id'=>'stylesheet-bom-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary(array($model, $cc_model)); ?>

    <div id = 'stylesheet_bom' class='row' style='border-radius: 5px; background: #EFEFEF; padding: 10px;'>
     <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'countryid'); ?>
        <?php echo $form->dropDownList($model, "countryid",$countries, array(
        		'empty' => "Select Country", 
        		"class"=>"miniform-dd",
        		'ajax' => array(
					'type'=>'POST',
					'url'=>CController::createUrl('getCountryDepts'),
					'update'=>"#StylesheetBom_fulldept",
					//'update' => "#test",
					//'data'=>'js:$(this).serialize()',
			
			        )
        ));?>
        
    </div>

     <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'fulldept'); ?>
        <?php echo $form->dropDownList($model, 'fulldept', $depts, array('empty' => "Select DCS", "class"=>"miniform-dd"));?>
        
    </div>
    <?php /*
    <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'dept_id'); ?>
        <?php echo $form->dropDownList($model, "dept_id", $depts["dept"], array('empty' => "select department", "class"=>"miniform-dd"));?>
        
    </div>

    <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'class_id'); ?>
        <?php echo $form->dropDownList($model, "class_id", $depts["class"], array('empty' => "select class", "class"=>"miniform-dd"));?>
      
    </div>

   <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'subclass_id'); ?>
        <?php echo $form->dropDownList($model, "subclass_id", $depts["subclass"], array('empty' => "select subclass", "class"=>"miniform-dd"));?>

    </div>
    */
    ?>
     <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'item_desc'); ?>
        <?php echo $form->textField($model,'item_desc',array('size'=>13,'maxlength'=>40)); ?>
        
    </div>

    <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'item_cons'); ?>
        <?php echo $form->textField($model,'item_cons',array('size'=>13,'maxlength'=>20)); ?>
        
    </div>

    <div class="row" style="float:left; margin-right: 20px">
        <?php echo $form->labelEx($model,'item_placement'); ?>
        <?php echo $form->textField($model,'item_placement',array('size'=>13,'maxlength'=>40)); ?>
        
    </div>
	<div style="clear: Both;"></div>
	
	<?php echo $form->error($model,'item_desc'); ?>
	<?php echo $form->error($model,'item_cons'); ?>
	<?php echo $form->error($model,'item_placement'); ?>
	<?php echo $form->error($model,'countryid'); ?>
	<?php echo $form->error($model,'fulldept'); ?>
	
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($cc_model,'color'); ?>
		<?php echo $form->dropDownList($cc_model, "color", $colors, array('empty' => "select color", "class"=>"miniform-dd")); ?>
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($cc_model,'shadow'); ?>
		<?php echo $form->dropDownList($cc_model, "shadow", $shadows, array('empty' => "select shadow", "class"=>"miniform-dd"));?>
	</div>
	
	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($cc_model,'pattern'); ?>
		<?php echo $form->dropDownList($cc_model, "pattern", $patterns, array('empty' => "select pattern", "class"=>"miniform-dd"));?>
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($cc_model,'length'); ?>
		<?php echo $form->dropDownList($cc_model, "length", $lengths, array('empty' => "select length", "class"=>"miniform-dd"));?>
		
	</div>

	<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($cc_model,'shape'); ?>
		<?php echo $form->dropDownList($cc_model, "shape", $shapes, array('empty' => "select shape", "class"=>"miniform-dd"));?>
		
	</div>

	<div style="clear: both;"></div>
	
	<?php echo $form->error($cc_model,"color_code"); ?>
	<?php echo $form->error($cc_model,"color"); ?>
	<?php echo $form->error($cc_model,"shadow"); ?>
	<?php echo $form->error($cc_model,"pattern"); ?>
	<?php echo $form->error($cc_model,"length"); ?>
	<?php echo $form->error($cc_model,"shape"); ?>
	
  
	
	
	</div>
	
    <div class="row buttons" style="float:right">
        <?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
    </div>
	<div style="clear: both;"></div>
<?php $this->endWidget(); ?>

</div><!-- form -->