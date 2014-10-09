<?php
/* @var $this ColorPatternController */
/* @var $data ColorPattern */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_pattern')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_pattern), array('view', 'id'=>$data->color_pattern)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pattern_desc_e')); ?>:</b>
	<?php echo CHtml::encode($data->pattern_desc_e); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pattern_desc_a')); ?>:</b>
	<?php echo CHtml::encode($data->pattern_desc_a); ?>
	<br />


</div>