<?php
/* @var $this ColorCodeController */
/* @var $data ColorCode */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_code')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_code), array('view', 'id'=>$data->color_code)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color')); ?>:</b>
	<?php echo CHtml::encode($data->color); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shadow')); ?>:</b>
	<?php echo CHtml::encode($data->shadow); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pattern')); ?>:</b>
	<?php echo CHtml::encode($data->pattern); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('length')); ?>:</b>
	<?php echo CHtml::encode($data->length); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shape')); ?>:</b>
	<?php echo CHtml::encode($data->shape); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_serial')); ?>:</b>
	<?php echo CHtml::encode($data->color_serial); ?>
	<br />


</div>