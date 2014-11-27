<?php
/* @var $this StylesheetBomController */
/* @var $model StylesheetBom */
/* @var $form CActiveForm */
Yii::import('application.controllers.DepartmentController');
Yii::import('application.controllers.ColorController');
Yii::import('application.controllers.ColorShadowController');
Yii::import('application.controllers.ColorPatternController');
Yii::import('application.controllers.ColorShapeController');
$colors = ColorController::getColors();
$shadows = ColorShadowController::getShadows();
$patterns = ColorPatternController::getPatterns();
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

     <div class="row" style="margin-right: 20px">
        <?php echo $form->labelEx($model,'fulldept'); ?>
        <?php echo $form->dropDownList($model, 'fulldept', $depts, array('empty' => "Select DCS", "width"=>"70px"));?>
        
    </div>
    
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
	
	<?php // :TODO: use render _miniForm instead of writing everything down again?>
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
		<?php echo $form->labelEx($cc_model,'shape'); ?>
		<?php echo $form->dropDownList($cc_model, "shape", $shapes, array('empty' => "select shape", "class"=>"miniform-dd"));?>
		
	</div>

	<div style="clear: both;"></div>
	<?php echo $form->error($cc_model,"color_code"); ?>
	<?php echo $form->error($cc_model,"color"); ?>
	<?php echo $form->error($cc_model,"shadow"); ?>
	<?php echo $form->error($cc_model,"pattern"); ?>
	<?php echo $form->error($cc_model,"shape"); ?>
	</div>
	
    <div class="row buttons" style="float:right">
        <?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
    </div>
	<div style="clear: both;"></div>
<?php $this->endWidget(); ?>

</div><!-- form -->