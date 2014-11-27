<?php
/* @var $this StylesheetController */
/* @var $data Stylesheet */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->ss_id), array('view', 'id'=>$data->ss_id)); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('brand')); ?>:</b>
	<?php echo CHtml::encode($data->brand); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('category')); ?>:</b>
	<?php echo CHtml::encode($data->category); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('countryName')); ?>:</b>
	<?php echo CHtml::encode($data->countryName); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('formatSeasons')); ?>:</b>
	<?php echo CHtml::encode($data->formatSeasons); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs')); ?>:</b>
	<?php echo CHtml::encode($data->dcs); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_notes')); ?>:</b>
	<?php echo CHtml::encode($data->dcs_notes); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('desc1')); ?>:</b>
	<?php echo CHtml::encode($data->desc1); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('style_code')); ?>:</b>
	<?php echo CHtml::encode($data->style_code); ?>
	<br />
	
	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('pono')); ?>:</b>
	<?php echo CHtml::encode($data->pono); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_notes')); ?>:</b>
	<?php echo CHtml::encode($data->dcs_notes); ?>
	<br />

	

	<b><?php echo CHtml::encode($data->getAttributeLabel('stylesheet_note')); ?>:</b>
	<?php echo CHtml::encode($data->stylesheet_note); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fabric')); ?>:</b>
	<?php echo CHtml::encode($data->fabric); ?>
	<br />

	*/ ?>

</div>