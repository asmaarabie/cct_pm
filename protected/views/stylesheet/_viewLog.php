<?php
/* @var $this StylesheetLogController */
/* @var $data StylesheetLog */
?>

<div class="view">

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
	<?php echo CHtml::link (CHtml::encode($data->user0->user_name), array("user/view", "id"=>$data->user)); ?>
	<br />


</div>