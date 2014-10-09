<?php
/* @var $this ColorLengthController */
/* @var $data ColorLength */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_length')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_length), array('view', 'id'=>$data->color_length)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('length_desc_e')); ?>:</b>
	<?php echo CHtml::encode($data->length_desc_e); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('length_desc_a')); ?>:</b>
	<?php echo CHtml::encode($data->length_desc_a); ?>
	<br />


</div>