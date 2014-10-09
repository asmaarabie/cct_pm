<?php
/* @var $this ColorCodeController */
/* @var $data ColorCode */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_code')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_code), array('view', 'id'=>$data->color_code)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color0->color_desc_e), array('color/view', 'id'=>$data->color0->color_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shadow')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->shadow0->shadow_desc_e),  array('colorShadow/view', 'id'=>$data->shadow0->color_shadow)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pattern')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->pattern0->pattern_desc_e),  array('colorPattern/view', 'id'=>$data->pattern0->color_pattern)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('length')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->length0->length_desc_e),  array('colorLength/view', 'id'=>$data->length0->color_length)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shape')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->shape0->shape_desc_e),  array('colorShape/view', 'id'=>$data->shape0->color_shape)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_serial')); ?>:</b>
	<?php echo CHtml::encode($data->color_serial); ?>
	<br />


</div>