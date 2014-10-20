<?php
/* @var $this StylesheetLogController */
/* @var $data StylesheetLog */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_log_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->ss_log_id), array('view', 'id'=>$data->ss_log_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('stylesheet_id')); ?>:</b>
	<?php echo CHtml::encode($data->stylesheet_id); ?>
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('user')); ?>:</b>
	<?php echo CHtml::encode($data->user); ?>
	<br />


</div>