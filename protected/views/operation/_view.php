<?php
/* @var $this OperationController */
/* @var $data Operation */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('op_name')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->op_name), array('view', 'id'=>$data->op_name)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('operation')); ?>:</b>
	<?php echo CHtml::encode($data->operation); ?>
	<br />


</div>