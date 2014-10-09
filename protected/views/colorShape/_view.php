<?php
/* @var $this ColorShapeController */
/* @var $data ColorShape */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_shape')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_shape), array('view', 'id'=>$data->color_shape)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shape_desc_e')); ?>:</b>
	<?php echo CHtml::encode($data->shape_desc_e); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shape_desc_a')); ?>:</b>
	<?php echo CHtml::encode($data->shape_desc_a); ?>
	<br />


</div>