<?php
/* @var $this DCSNameController */
/* @var $data DCSName */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->dcs_id), array('view', 'id'=>$data->dcs_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fulldept')); ?>:</b>
	<?php echo CHtml::encode($data->fulldept); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('country_id')); ?>:</b>
	<?php echo CHtml::encode($data->country_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_name')); ?>:</b>
	<?php echo CHtml::encode($data->dcs_name); ?>
	<br />


</div>