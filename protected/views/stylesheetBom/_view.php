<?php
/* @var $this StylesheetBomController */
/* @var $data StylesheetBom */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_bom_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->ss_bom_id), array('view', 'id'=>$data->ss_bom_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
	<?php echo CHtml::encode($data->ss_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_name')); ?>:</b>
	<?php echo CHtml::encode($data->dcs_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dept_id')); ?>:</b>
	<?php echo CHtml::encode($data->dept_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('class_id')); ?>:</b>
	<?php echo CHtml::encode($data->class_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('subclass_id')); ?>:</b>
	<?php echo CHtml::encode($data->subclass_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_color_id')); ?>:</b>
	<?php echo CHtml::encode($data->item_color_id); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('item_desc')); ?>:</b>
	<?php echo CHtml::encode($data->item_desc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_cons')); ?>:</b>
	<?php echo CHtml::encode($data->item_cons); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_placement')); ?>:</b>
	<?php echo CHtml::encode($data->item_placement); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('countryid')); ?>:</b>
	<?php echo CHtml::encode($data->countryid); ?>
	<br />

	*/ ?>

</div>