<?php
/* @var $this UserController */
/* @var $data User */
?>

<div class="view">
	<b><?php echo CHtml::encode($data->getAttributeLabel('user_name')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->user_name), array('view', 'id'=>$data->user_id)); ?>
	<br />

</div>