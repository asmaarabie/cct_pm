<?php
/* @var $this ColorShadowController */
/* @var $data ColorShadow */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('color_shadow')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->color_shadow), array('view', 'id'=>$data->color_shadow)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('shadow_desc_e')); ?>:</b>
	<?php echo CHtml::encode($data->shadow_desc_e); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('shadow_desc_a')); ?>:</b>
	<?php echo CHtml::encode($data->shadow_desc_a); ?>
	<br />
	

</div>