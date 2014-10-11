<?php
/* @var $this SizeController */
/* @var $data Size */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('scale_number')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->scale_number), array('view', 'id'=>$data->scale_number)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('scale_size')); ?>:</b>
	<?php echo CHtml::encode($data->scale_size); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('scale_name')); ?>:</b>
	<?php echo CHtml::encode($data->scale_name); ?>
	<br />


</div>