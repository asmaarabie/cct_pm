<?php
/* @var $this BomsheetController */
/* @var $data Bomsheet */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('bs_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->bs_id), array('view', 'id'=>$data->bs_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ss_id')); ?>:</b>
	<?php echo CHtml::encode($data->ss_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pono')); ?>:</b>
	<?php echo CHtml::encode($data->pono); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_id')); ?>:</b>
	<?php echo CHtml::encode($data->user_id); ?>
	<br />


</div>