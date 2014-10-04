<?php
/* @var $this PrivilegesController */
/* @var $data Privileges */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('priv_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->priv_id), array('view', 'id'=>$data->priv_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('priv_name')); ?>:</b>
	<?php echo CHtml::encode($data->priv_name); ?>
	<br />


</div>