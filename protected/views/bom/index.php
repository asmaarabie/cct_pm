<?php
/* @var $this BomController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom',
);

$this->layout = '//layouts/column1';

?>
<div class="stylesheet-galleryView">
	
	<div style="float:left;width:40%">
	
		<h4>BOM/BOQ</h4>
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('season')); ?>:</b>
		<?php echo CHtml::encode($ss_model->seasons[$ss_model->season].' ( '.$ss_model->year.' )'); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('category')); ?>:</b>
		<?php echo CHtml::encode($ss_model->category); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('brand')); ?>:</b>
		<?php echo CHtml::encode($ss_model->brand); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('style_code')); ?>:</b>
		<?php echo CHtml::encode($ss_model->style_code); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('pono')); ?>:</b>
		<?php echo isset($ss_model->pono)? CHtml::encode($ss_model->pono):"-"; ?>
		<br />
		
	</div>
	
	<div style="margin-left:20px; float:right; width:40%">
		<h4>Sizes Quantities</h4>
		<?php 
		$sizes = Size::model()->getScaleSizes($ss_model->scale);
		$model_sizes = $ss_model->sizes;
		?>
		
		<div  class='grid-view'>
			<table class="items">
			<thead>
			<tr>
			<?php 
			for ($i = 0 ; $i < count ($sizes); $i++) {
				if (substr($model_sizes,$i,1)=="1")
					echo "<th>".CHtml::label ($sizes[$i], 'label_box'.$i)."</th>";
			}
			echo "<th> Total </th>";
			?>
			</tr>
			</thead>
			<tbody>
			<tr>
			<?php 
			$sum = 0;
			for ($i = 0 ; $i < count ($sizes); $i++) {
				if (substr($model_sizes,$i,1)=="1") {
					$sizeModel = SsSizeQty::model()->findByAttributes(array('ss_id'=>$ss_model->ss_id, 'size'=>$sizes[$i]));
					echo "<td style= 'text-align:center'>";
					if (isset($sizeModel)) {
						echo $sizeModel->size_qty; 
						$sum += $sizeModel->size_qty;
					}
					else 
						echo "0";
					echo "</td>";
					
				}
			}
			echo "<td style= 'text-align:center'>".$sum."</td>";
			?>
			</tr>
			</tbody>
			</table>
		</div>
	
		<div class="row buttons" style="float:right">
			<?php echo CHtml::link('Modify', array('modifySizeQty', 'ss_id'=>$ss_model->ss_id)); ?>
		</div>
		<div style="clear:both;"></div>
	
	</div>
	<div style="clear:both;"></div>
</div>
<br/>


<div class="stylesheet-galleryView">
<h2>Bom Items</h2>
<?php 
if (count($ssBomItems) != 0) {
	Yii::import('application.controllers.StylesheetBomController');
	StylesheetBomController::widget('SpecialCListView', array(
		'dataProvider'=>$ssBomItemsDataProvider,
		'itemView'=>'_stylesheetBomItems',
		'items' => $bomItems,
	));
	
} else {
	echo CHtml::link('Fill in the stylesheet bom items first', array('stylesheetBom/create', 'ss_id'=>$ss_model->ss_id));
}
?>
</div>

<?php 
echo CHtml::ajaxLink(
    'View Bom Log',
    array("bom/getLogEntries&ss_id={$ss_model->ss_id}"), // the URL for the AJAX request. If empty, it is assumed to be the current URL.
    array(
		'type' => 'POST',
        'update'=>"#bom_log",
    )
);
?>
<br/>
<div id="bom_log"></div>
