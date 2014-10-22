<?php
/* @var $this MarkerController */
/* @var $data Marker */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('marker_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->marker_id), array('view', 'id'=>$data->marker_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
	<?php echo CHtml::encode($data->ss_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('width')); ?>:</b>
	<?php echo CHtml::encode($data->width); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('length')); ?>:</b>
	<?php echo CHtml::encode($data->length); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('utilization')); ?>:</b>
	<?php echo CHtml::encode($data->utilization); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('t_size')); ?>:</b>
	<?php echo CHtml::encode($data->t_size); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ratio')); ?>:</b>
	<?php echo CHtml::encode($data->ratio); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('marker_name')); ?>:</b>
	<?php echo CHtml::encode($data->marker_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('owner')); ?>:</b>
	<?php echo CHtml::encode($data->owner); ?>
	<br />

	*/ ?>

</div>