<?php
/* @var $this BomsheetController */
/* @var $model Bomsheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	"BOM"
);

$this->layout = '//layouts/column1';
?>

<div class="stylesheet-galleryView">
	
	<div style="float:left;width:40%">
	
		<h4>BOM/BOQ</h4>
		<b><?php echo CHtml::encode($model->getAttributeLabel('bs_id')); ?>:</b>
		<?php echo CHtml::encode($model->bs_id); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('season')); ?>:</b>
		<?php echo CHtml::encode($ss_model->seasons[$ss_model->season].' ( '.$ss_model->year.' )'); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('dcs')); ?>:</b>
		<?php echo CHtml::encode($ss_model->dcs); ?>
		<br />
		<b><?php echo CHtml::encode($ss_model->getAttributeLabel('fulldept')); ?>:</b>
		<?php echo CHtml::encode($ss_model->fulldept); ?>
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
		<?php echo CHtml::encode($ss_model->pono); ?>
	</div>
	
	<div style="margin-left:20px; float:right; width:40%">
		<h4>Sizes Quantities</h4>
		<div  class='grid-view'>
			<table class="items">
			<thead>
			<tr>
			<?php 
			foreach ($sizes as $i=>$size) 
				echo "<th>".CHtml::label ($size->size, 'label_box'.$i)."</th>";
			echo "<th> Total </th>";
			?>
			</tr>
			</thead>
			<tbody>
			<tr>
			<?php 
			$sum = 0;
			foreach ($sizes as $i=>$size) {
				echo "<td style= 'text-align:center'>".$size->size_qty."</td>";
				$sum += $size->size_qty;
			}
			echo "<td style= 'text-align:center'>".$sum."</td>";
			?>
			</tr>
			</tbody>
			</table>
		</div>
	</div>
	<div style="clear:both;"></div>
		
		<?php 
		if ($this->can('update', $model))
			echo CHtml::link('Change Pono',  array('bomsheet/update', 'id'=>$model->bs_id, 'ss_id'=>$model->ss_id), array('class'=> 'link-button')); 
		?>
		<?php 
		if ($this->can('delete', $model)) 
			echo CHtml::link('Delete BOM',"#", array("submit"=>array('delete', 'id'=>$model->bs_id), 'confirm' => 'Are you sure?', 'class'=> 'link-button')); 
		?>
		<?php 
		if ($this->can('update', $model))
			echo CHtml::link('Modify Sizes',  array('modifySizeQty', 'bs_id'=>$model->bs_id, 'ss_id'=>$model->ss_id), array('class'=> 'link-button')); 
		?>
		<?php 
		if ($this->can('update', $model))
			echo CHtml::link('Add note',  array('bomsheet/addNote', 'bs_id'=>$model->bs_id, 'ss_id'=>$model->ss_id), array('class'=> 'link-button')); 
		?>
		<?php echo CHtml::link('Export to Excel', array('createExcel', 'bs_id'=>$model->bs_id), array('class'=> 'link-button')); ?>
		<?php echo CHtml::link('Export to PDF', array('exportToPDF', 'bs_id'=>$model->bs_id, 'ss_id'=>$model->ss_id), array('class'=> 'link-button')); ?>
</div>

<div class="stylesheet-galleryView">
<h2>Bom Items</h2>
<?php 
if (count($ssBomItemsDataProvider->getData()) != 0) {
	Yii::import('application.controllers.StylesheetBomController');
	StylesheetBomController::widget('SpecialCListView', array(
		'dataProvider'=>$ssBomItemsDataProvider,
		'itemView'=>'_stylesheetBomItems',
		'items' => $bomItems,
		'bs_id' => $model->bs_id
	));
	
} else {
	echo "No accessories/trims in the stylesheet yet<br/>";
	echo CHtml::link('Fill the stylesheet bom items first',  array('stylesheetBom/create', 'ss_id'=>$ss_model->ss_id), array( 'class'=>'link-button'));
}
?>
</div>

<div class="stylesheet-galleryView" id="bom_log">
<?php 
echo CHtml::ajaxLink('View Bom Log',
		array("bomsheet/getLogEntries&bs_id={$model->bs_id}"), // the URL for the AJAX request. If empty, it is assumed to be the current URL.
		array(
			'type' => 'POST',
	        'update'=>"#bom_log",
		'beforeSend' => 'function() {
		   $("#bom_log").addClass("loading");
		}',
		'complete' => 'function() {
		  $("#bom_log").removeClass("loading");
		}'
	    ),
		array('class'=> 'link-button')
);
?>
</div>

