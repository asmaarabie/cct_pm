<head>
<style>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/printView.css" />
</style>
</head>
<?php 
	$iso = IsoHeader::model()-> findByAttributes(array('def'=>'1'));
	// Bom attributes
	$attributes = array (
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
			'price',
			'cost'
	);
	$ss_bom = new Bom();
	$sizes = SsSizeQty::model()->findAllByAttributes(array('bs_id'=>$model->bs_id));
?>

<table class='header' >
	<tr>
		<?php if ($iso !==NULL) {?>
		<th> <?php echo $iso->header_code;?> </th>
		<th> <?php echo $iso->date. ' التاريخ ';?> </th>
		<th> <?php echo  " الاصدار رقم ($iso->version)";?> </th>
		<?php }?>
	</tr>
	<tr>
		<th> 
			Concrete for ready made
			<br/>
			Garments
			<br/>
			إدارة التخطيط
		</th>
		<th> 
			BOM  بيان 
			<p> Serial: <?php echo $model->bs_id;?> </p>
		</th>
		<th> 
			
		</th>
	</tr>
</table>

<br/>
<table class="sizes">
	<tr>
		<th>Sizes Quantities</th>
	</tr>
</table>
<table class="sizes">
	
	<tr>
	<?php 
		foreach ($sizes as $i=>$size) 
			echo "<th>".CHtml::label ($size->size, 'label_box'.$i)."</th>";
		echo "<th> Total </th>";
	?>
	</tr>
	
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
</table>

<br/>
<table class="header3" >
	<tr>
		<th> BOM/BOQ </th>
		<th> <?php echo $ss_model->seasons[$ss_model->season]." (".$ss_model->year.") ";?> </th>
		<th> <?php echo $ss_model->brand;?> </th>
		<th> <?php echo $ss_model->style_code;?> </th>
		<th> <?php echo $ss_model->pono;?>  </th>
	</tr>
</table>
<table class="items">
	<tr>
		<?php 
		foreach ($attributes as $att) {
			$der_att = $ss_bom->attributeLabels();
			echo "<th>".$der_att[$att]."</th>";
		}
		?>
		
	</tr>
	
		<?php 
		foreach ($bomItems as $model) {
			echo "<tr>";
			foreach ($attributes as $att) {
				echo "<td>".$model[$att]."</td>";
			}
			echo "</tr>";
		}
		
		?>
</table>

<table class="items">
	<tr>
		<th> باقي الاكسسوارات توريد المورد</th>
	</tr>
</table>
