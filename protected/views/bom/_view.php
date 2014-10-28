<?php
/* @var $this BomController */
/* @var $data Bom */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('bom_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->bom_id), array('view', 'id'=>$data->bom_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
	<?php echo CHtml::encode($data->ss_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_desc')); ?>:</b>
	<?php echo CHtml::encode($data->item_desc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_placement')); ?>:</b>
	<?php echo CHtml::encode($data->item_placement); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bom_dcs_code')); ?>:</b>
	<?php echo CHtml::encode($data->bom_dcs_code); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_qty')); ?>:</b>
	<?php echo CHtml::encode($data->item_qty); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item_consumption')); ?>:</b>
	<?php echo CHtml::encode($data->item_consumption); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('item_increase')); ?>:</b>
	<?php echo CHtml::encode($data->item_increase); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pono')); ?>:</b>
	<?php echo CHtml::encode($data->pono); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('countryid')); ?>:</b>
	<?php echo CHtml::encode($data->countryid); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('itemno')); ?>:</b>
	<?php echo CHtml::encode($data->itemno); ?>
	<br />

	*/ ?>

</div>