<?php
/* @var $this GroupOperationsController */
/* @var $data GroupOperations */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('grp_op_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->grp_op_id), array('view', 'id'=>$data->grp_op_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('group_id')); ?>:</b>
	<?php echo CHtml::encode($data->group_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('op_name')); ?>:</b>
	<?php echo CHtml::encode($data->op_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('checked')); ?>:</b>
	<?php echo CHtml::encode($data->checked); ?>
	<br />


</div>