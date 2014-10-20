<?php
/* @var $this StylesheetController */
/* @var $model Stylesheet */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stylesheet-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
	//'htmlOptions' => array('enctype' => 'multipart/form-data'), // ADD THIS
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	
	<div class="row" style="border-radius: 5px; background: #EFEFEF; padding: 10px">
	
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'country_id'); ?>
			<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
			        'attribute' => 'country_id',
					'model'=>$model,
			        'sourceUrl'=> '?r=country/getCountryAjax',
			        'htmlOptions'=>array(
						'placeholder'=>'BOM',
						'minLength'=>'1',
						'maxlength'=>5,
						'size'=>10),
					
					'options'=>array(
						'showAnim'=>'fold'),
			         ));
			?>
		</div>
	
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'dept_id'); ?>
			<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
			        'attribute' => 'dept_id',
					'model'=>$model,
			        'sourceUrl'=> '?r=department/getDCSAjax&param=deptid',
			        'htmlOptions'=>array(
						'placeholder'=>'C52',
						'minLength'=>'1',
						'maxlength'=>5,
						'size'=>10),
					
					'options'=>array(
						'showAnim'=>'fold'),
			         ));
			?>
		</div>
	
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'class_id'); ?>
			<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
			        'attribute' => 'class_id',
					'model'=>$model,
			        'sourceUrl'=> '?r=department/getDCSAjax&param=classid',
			        'htmlOptions'=>array(
						'placeholder'=>'5',
						'minLength'=>'1',
						'maxlength'=>5,
						'size'=>10),
					
					'options'=>array(
						'showAnim'=>'fold'),
			         ));
			?>
			
		</div>
		
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'subclass_id'); ?>
			<?php $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
			        'attribute' => 'subclass_id',
					'model'=>$model,
			        'sourceUrl'=> '?r=department/getDCSAjax&param=subclassid',
			        'htmlOptions'=>array(
						'placeholder'=>'PJ',
						'minLength'=>'1',
						'maxlength'=>5,
						'size'=>10),
					
					'options'=>array(
						'showAnim'=>'fold'),
			         ));
			?>
			
		</div>
		
		<div class="row" style="float:left; margin-right: 20px">
		<?php echo $form->labelEx($model,'dcs_notes'); ?>
		<?php echo $form->textField($model,'dcs_notes',array('size'=>20,'maxlength'=>40)); ?>
		
	
	
		</div>
		<div style="clear: both;" ></div>
		<?php echo $form->error($model,'country_id'); ?>
		<?php echo $form->error($model,'dept_id'); ?>
		<?php echo $form->error($model,'class_id'); ?>
		<?php echo $form->error($model,'subclass_id'); ?>
		<?php echo $form->error($model,'dcs_notes'); ?>
	</div>
	
	<div class="row" style="border-radius: 5px; background: #EFEFEF; padding: 10px">
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'season'); ?>
			<?php echo CHtml::activeDropDownList($model,'season',
					$model->seasonOptions,
					array('empty'=>'select a season'));
			 ?>
			
		</div>
	
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'year'); ?>
			<?php echo CHtml::activeDropDownList($model,'year',
					$model->yearOptions, 
					array('empty'=>'select a year')); ?>
			
		</div>
		<div class="row" style="float:left; margin-right: 20px">
			<?php echo $form->labelEx($model,'scale'); ?>
			<?php $list = CHtml::listData($scales,'scale_number', 'scale_name');?>
			<?php
			echo $form->dropDownList($model, 'scale', $list, array('empty' => "select a scale",
			'ajax'=>array(
					'type'=>'POST',
					'url'=>CController::createUrl('size/getSizesAjax'),
					'update'=>'#scale-size-Ajax',
			)));
			?>
			<div id = "scale-size-Ajax">
			<?php
			//Yii::import('application.controllers.SizeController');
			$this->fillSizesView($model);
			?>
			</div>
			<?php echo CHtml::activeHiddenField($model,'sizes');?>
		</div>
		
		<div style="clear: both;" ></div>
		<?php echo $form->error($model,'season'); ?>
		<?php echo $form->error($model,'year'); ?>
		<?php echo $form->error($model,'scale'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'style_code'); ?>
		<?php echo $form->textField($model,'style_code',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'style_code'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'fabric'); ?>
		<?php echo $form->textField($model,'fabric',array('size'=>40,'maxlength'=>40)); ?>
		<?php echo $form->error($model,'fabric'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($model,'stylesheet_note'); ?>
		<?php echo $form->textArea($model,'stylesheet_note',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'stylesheet_note'); ?>
	</div>
	
	<div class="row buttons" style = "float:right">
		<?php 
			if ($model->isNewRecord ) {
				echo CHtml::submitButton('Next: Upload pictures > ');
			} else {
				echo CHtml::submitButton('Save');
			}
		?>
	
	</div>
	<div style = "clear:both"></div>
<?php $this->endWidget(); ?>

</div><!-- form -->