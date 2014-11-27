<?php
/* @var $this DepartmentNameController */
/* @var $data DepartmentName */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('dept_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->dept_id), array('view', 'id'=>$data->dept_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dept_name')); ?>:</b>
	<?php echo CHtml::encode($data->dept_name); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('countryid')); ?>:</b>
	<?php echo CHtml::encode($data->countryid); ?>
	<br />

</div>