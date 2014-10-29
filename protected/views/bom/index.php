<?php
/* @var $this BomController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Stylesheets'=>array('stylesheet/index'),
	$ss_model->style_code=>array('stylesheet/view','id'=>$ss_model->ss_id),
	'Bom',
);

$this->menu=array(
	array('label'=>'Create Bom', 'url'=>array('create')),
	array('label'=>'Manage Bom', 'url'=>array('admin')),
);
?>

<h1>Bom</h1>
<h2>Sizes Quantities</h2>
<div class="stylesheet-galleryView">
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

?>
</tr>
</thead>
<tbody>
<tr>
<?php 
for ($i = 0 ; $i < count ($sizes); $i++) {
	if (substr($model_sizes,$i,1)=="1") {
		$sizeModel = SsSizeQty::model()->findByAttributes(array('ss_id'=>$ss_model->ss_id, 'size'=>$sizes[$i]));
		echo "<td style= 'text-align:center'>".$sizeModel->size_qty."</td>";
		
	}
}
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
<br/>

<h2>Bom Items</h2>
<div class="stylesheet-galleryView">

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