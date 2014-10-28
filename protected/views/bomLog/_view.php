<?php
/* @var $this BomLogController */
/* @var $data BomLog */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('bom_log_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->bom_log_id), array('view', 'id'=>$data->bom_log_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bom_id')); ?>:</b>
	<?php echo CHtml::encode($data->bom_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('action_time_stamp')); ?>:</b>
	<?php echo CHtml::encode($data->action_time_stamp); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('action_type')); ?>:</b>
	<?php echo CHtml::encode($data->action_type); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('action_comment')); ?>:</b>
	<?php echo CHtml::encode($data->action_comment); ?>
	<br />


</div>