<?php
/* @var $this IsoHeaderController */
/* @var $data IsoHeader */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('header_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->header_id), array('view', 'id'=>$data->header_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('header_code')); ?>:</b>
	<?php echo CHtml::encode($data->header_code); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('version')); ?>:</b>
	<?php echo CHtml::encode($data->version); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('date')); ?>:</b>
	<?php echo CHtml::encode($data->date); ?>
	<br />


</div>