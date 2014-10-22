<?php
/* @var $this StylesheetController */
/* @var $model Stylesheet */

$this->breadcrumbs=array(
	'Stylesheets'=>array('index'),
	$model->style_code." - ".$model->formatSeasons,
);

$this->menu=array(
	array('label'=>'Manage this stylesheet', 'items'=> array(
			array('label'=>'Copy Stylesheet', 'url'=>array('copy', 'ss_id'=>$model->ss_id)),
			array('label'=>'Update Stylesheet', 'url'=>array('update', 'id'=>$model->ss_id)),
			array('label'=>'Delete Stylesheet', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ss_id),'confirm'=>'Are you sure you want to delete this item?')),
			array('label'=>'Stylesheet images', 'url'=>array('stylesheetImages/index', 'ss_id'=>$model->ss_id)),
			array('label'=>'Stylesheet colors', 'url'=>array('stylesheetColor/index', 'ss_id'=>$model->ss_id)),
			array('label'=>'Stylesheet Marker', 'url'=>array('marker/manage', 'ss_id'=>$model->ss_id)),
	)),
	
	array('label'=>'Other operations', 'items'=> array(
		array('label'=>'List Stylesheet', 'url'=>array('index')),
		array('label'=>'Create Stylesheet', 'url'=>array('create')),
		array('label'=>'Manage Stylesheets', 'url'=>array('admin')),
	)),
	
	
);
?>

<h1>View Stylesheet #<?php echo $model->style_code." - ".$model->formatSeasons ?></h1>

<div class = "stylesheet-galleryView">
<h2>Basic Info</h2>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ss_id',
		'brand',
		'category',
		'countryName',
		array (
			'label'=> $model->attributeLabels()['season'],
				'type'=>'raw',
				'value'=>CHtml::encode($model->seasons["{$model->season}"])),
		'year',
		'dcs',
		'desc1',
		'style_code',
		'fabric',
		'stylesheet_note',
		'pono',
		'owner'
		
	),
)); 

?>
</div>

<div class = "stylesheet-galleryView">
<h2>Sizes</h2>
<?php 
$options = Size::model()->getScaleSizes($model->scale);
$sizes = $model->sizes;	
	for ($i = 0 ; $i < count ($options); $i++) {
		$str= "<span style='float:left; margin: 10px 10px 10px 0'>".
		CHtml::label ($options[$i], 'label_box'.$i)."<br/>";
		
		if (substr($sizes,$i,1)=="1")
			$str.="&#10004";
		else 
			$str.="&#10006";
		
		$str.="</span>";
		echo  $str;
	}
?>
<div style='clear:both' ></div>
</div>
<div class = "stylesheet-galleryView">
<h2>Images</h2>
<?php 
$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$images,
	'itemView'=>'_imagesView',
	'summaryText'=>'',
)); ?>
<div style="clear:both;"> </div>
</div>


<div class = "stylesheet-galleryView">
<h2>Colors</h2>
<?php 
$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$colors,
	'itemView'=>'_colorsView',
	'summaryText'=>'',
)); ?>
<div style="clear:both;"> </div>
</div>

<?php 
echo CHtml::ajaxLink(
    'View Log',          // the link body (it will NOT be HTML-encoded.)
    array("stylesheet/getLogEntries&ss_id={$model->ss_id}"), // the URL for the AJAX request. If empty, it is assumed to be the current URL.
    array(
        'update'=>'#ss_log',
		'complete' => 'function() {
          $("#ss_log").addClass("stylesheet-galleryView");
			$("#ss_log").show();
        }',
    )
);
?>
<div id="ss_log" style="display: none;">
	
</div>

