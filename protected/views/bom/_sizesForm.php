<?php
/* @var $this BomController */
/* @var $model Bom */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'bom-sizes-form',
	'enableAjaxValidation'=>true,
	'enableClientValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php $form->errorSummary($model);?>
	
	<div class="grid-view">
		<table class="items">
		<thead>
			<tr>
			<?php 
			foreach ($model as $size) {
					echo "<th class='my-th'>".CHtml::label ($size->size, 'label_box')."</th>";
			}
			
			?>
			</tr>
		</thead>
		<tbody>
			<tr>
			<?php 
			$i=0;
			foreach ($model as $i=>$size) {
					echo "<td>".$form->textField($size,"[$i]size_qty",array('size'=>4))."</td>"; 
					$i++;
					echo $form->error($size,"[$i]size_qty");
			}
			
			?>
			</tr>
		</tbody>
		</table>
	</div>
	<div class="row buttons" style="float:right">
	<?php echo CHtml::submitButton('Save'); ?>
	</div>
	<div style="clear:both;"></div>

<?php $this->endWidget(); ?>

</div><!-- form -->