<?php
/* @var $this SubclassNameController */
/* @var $data SubclassName */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('subclassid')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->subclassid), array('view', 'id'=>$data->subclassid)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('subclass_name')); ?>:</b>
	<?php echo CHtml::encode($data->subclass_name); ?>
	<br />


</div>