<?php
/* @var $this DCSSizeScaleController */
/* @var $data DCSSizeScale */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('DCS_size_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->DCS_size_id), array('view', 'id'=>$data->DCS_size_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('size_scale')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->sizeScale->scale_name), array('size/view', 'id'=>$data->sizeScale->scale_number)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('size_fulldept')); ?>:</b>
	<?php echo CHtml::encode($data->size_fulldept); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('size_country_id')); ?>:</b>
	<?php echo CHtml::encode($data->sizeCountry->countrydesc); ?>
	<br />


</div>