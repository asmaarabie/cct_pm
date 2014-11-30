<?php 
/*
 * $form stylesheetBom/_form
 * $model stylesheetBom
 * $i index of the $model in the whole array
 * $cc_model ColorCode
 */
/**
 * Saved for later enhancement (multi-record insertion)
 */
/*
$url = $this->createUrl('getCountryDepts');
Yii::app()->clientScript->registerScript ("removeItem",
"jQuery(document).on('click', '.remove_field', (function () { $(this).parent('div').remove(); } ));");

Yii::app()->clientScript->registerScript ("updateFullDept", "
		jQuery(document).on('change', '#StylesheetBom_".$i."_countryid',function() {
	//$.ajax({url:'".$url."',success:function(result){
		$('#test".$i."').text('ffffff');
	//}});
});
");
Yii::import('application.controllers.CountryController');
Yii::import('application.controllers.DepartmentController');
$countries = CountryController::getCountries();
$depts = DepartmentController::getDepartments();
?>

<div class="row" style="float:left; margin-right: 20px">
	
	<?php echo CHtml::activeLabelEx($model,"[$i]countryid"); ?>
	<?php echo CHtml::activeDropDownList($model, "[$i]countryid", $countries, array(
			//'liveEvents'=> true, 
			'empty' => "select country", 
			'class'=>"miniform-dd",
			//'id' => "StylesheetBom_{$i}_countryid",
			//'ajax' => array(
			//		'type'=>'POST',
			//		'url'=>CController::createUrl('getCountryDepts'),
			//		//'update'=>"#StylesheetBom_{$i}_dept_id",
			//		'update' => "#test{$i}",
			//		//'data'=>'js:$(this).serialize()',
			
			//        )
			        
	));?>
	
</div>
<div id = "<?php echo "test{$i}"?>" ></div>
<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]dept_id"); ?>
	<?php echo CHtml::activeDropDownList($model, "[$i]dept_id", $depts["dept"], array('empty' => "select department", "class"=>"miniform-dd"));?>
</div>

<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]class_id"); ?>
	<?php echo CHtml::activeDropDownList($model, "[$i]class_id", $depts["class"], array('empty' => "select class", "class"=>"miniform-dd"));?>
</div>

<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]subclass_id"); ?>
	<?php echo CHtml::activeDropDownList($model, "[$i]subclass_id", $depts["subclass"], array('empty' => "select subclass", "class"=>"miniform-dd"));?>
</div>

<div style="clear: Both;"></div>
<?php echo CHtml::error($model,"[$i]dept_id"); ?>
<?php echo CHtml::error($model,"[$i]class_id"); ?>
<?php echo CHtml::error($model,"[$i]subclass_id"); ?>

<?php 
$this->renderPartial('_miniForm', array('i'=>$i, 'cc_model'=>$cc_model)); 
?>

<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]item_desc"); ?>
	<?php echo CHtml::activeTextField($model,"[$i]item_desc",array('size'=>13)); ?>
	
</div>

<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]item_cons"); ?>
	<?php echo CHtml::activeTextField($model,"[$i]item_desc",array('size'=>13)); ?>
	
</div>

<div class="row" style="float:left; margin-right: 20px">
	<?php echo CHtml::activeLabelEx($model,"[$i]item_placement"); ?>
	<?php echo CHtml::activeTextField($model,"[$i]item_desc",array('size'=>13)); ?>
	
</div>

<div style="clear: Both;"></div>
<?php echo CHtml::error($model,"[$i]item_desc"); ?>
<?php echo CHtml::error($model, "[$i]item_cons"); ?>
<?php echo CHtml::error($model, "[$i]item_placement"); ?>



<?php echo CHtml::link('Remove', '#', array('class'=>'remove_field'));?>

*/?>