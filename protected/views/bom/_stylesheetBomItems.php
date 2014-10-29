<?php
/* @var $this BomController */
/* @var $data StylesheetBom */
?>

<div class="view">
	
	<table>
		<tr>
			<td width="50%"> 
				<b><?php echo CHtml::encode($data->getAttributeLabel('ss_bom_id')); ?>:</b>
				<?php echo CHtml::link(CHtml::encode($data->ss_bom_id), array('view', 'id'=>$data->ss_bom_id)); ?>
				<br />
			
				<b><?php echo CHtml::encode($data->getAttributeLabel('countryid')); ?>:</b>
				<?php echo CHtml::encode($data->country->countrydesc); ?>
				<br />
				
				<b><?php echo CHtml::encode($data->getAttributeLabel('code')); ?>:</b>
				<?php echo CHtml::encode($data->code); ?>
				<br />
			
				<b><?php echo CHtml::encode($data->getAttributeLabel('dcs_name')); ?>:</b>
				<?php echo CHtml::encode($data->dcs_name); ?>
				
			</td>
			
			<td width="50%"> 
				<b><?php echo CHtml::encode($data->getAttributeLabel('item_color_id')); ?>:</b>
				<?php echo CHtml::link(CHtml::encode($data->item_color_id), array('colorCode/view', 'id'=> $data->item_color_id)); ?>
				<br />
				
				<b><?php echo CHtml::encode($data->getAttributeLabel('item_desc')); ?>:</b>
				<?php echo CHtml::encode($data->item_desc); ?>
				<br />
			
				<b><?php echo CHtml::encode($data->getAttributeLabel('item_cons')); ?>:</b>
				<?php echo CHtml::encode($data->item_cons); ?>
				<br />
			
				<b><?php echo CHtml::encode($data->getAttributeLabel('item_placement')); ?>:</b>
				<?php echo CHtml::encode($data->item_placement); ?>
			</td>
		</tr>
	</table>
	
	<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
			'id'=>'ss-bom-per-record-grid',
			'dataProvider'=> $widget->items[$data->code],
			'columns'=>array(
					'itemno',
					'item_qty',
					'item_consumption',
					'item_increase',
					'item_desc',
					'item_placement',
					/*array(
							'class'=>'CButtonColumn',
							'template'=>'{view}{update}{delete}',
							'buttons'=>array (
									'view' => array ('url'=>'Yii::app()->createUrl("bom/view", array("id"=>$data->ss_bom_id))'),
									'delete' => array ('url'=>'Yii::app()->createUrl("bom/delete", array("id"=>$data->ss_bom_id))'),
									'update' => array ('url'=>'Yii::app()->createUrl("bom/update", array("id"=>$data->ss_bom_id))'),
							),
					),
					*/
			),
	));
	
	?>
 	
</div>