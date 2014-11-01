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
				
				<b><?php //echo CHtml::encode($data->getAttributeLabel('code')); 
						echo 'DCS Code'?>:</b>
				<?php echo CHtml::encode($data->fulldept); ?>
				<br />
			
				<b><?php //echo CHtml::encode($data->getAttributeLabel('dcs_name')); 
						echo 'DCS Name'?>:</b>
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
			'dataProvider'=> $widget->items[$data->ss_bom_id],
			'columns'=>array(
					'itemno',
					'itemColor',
					'item_desc',
					'itemCode',
					'itemSize',
					'item_qty',	
					'item_consumption',
					'itemRequired',	
					'item_increase',
					'item_placement',
					array(
							'class'=>'CButtonColumn',
							'template'=>'{update}{delete}',
					),
			),
	));
	
	?>
 	<?php echo CHtml::link('Add items', array('create', 'ss_bom_id'=>$data->ss_bom_id));?>
</div>