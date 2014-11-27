<head>
<style>
table.items{
    border-collapse: collapse;
    width: 100%
}
table.header3{
    border-collapse: collapse;
    width: 100%
}
table.sizes{
    border-collapse: collapse;
    width: 50%
}
table.items, table.items td, table.items th {
    border: 1px solid grey;
}
table.header3, table.header3 td, table.header3 th {
    border: 1px solid grey;
}
table.sizes, table.sizes td, table.sizes th {
    border: 1px solid grey;
}
table.items th, table.sizes th {
	border: solid 1px grey; 
	text-align: center; 
	background: #c9dbed;
	vertical-align: middle
}
table.header {
	width: 100%;
}
table.header th{
	width: 30%;
}

</style>
</head>
<?php 
	$iso = IsoHeader::model()-> findByPk(1);
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
	$sizes = Size::model()->getScaleSizes($model->scale);
	$model_sizes = $model->sizes;
?>

<table class='header' >
	<tr>
		<th> <?php echo $iso->header_code;?> </th>
		<th> <?php echo $iso->date. ' التاريخ ';?> </th>
		<th> <?php echo  " الاصدار رقم ($iso->version)";?> </th>
		
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
			BOM بيان
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
	for ($i = 0 ; $i < count ($sizes); $i++) {
		if (substr($model_sizes,$i,1)=="1")
			echo "<th>".CHtml::label ($sizes[$i], 'label_box'.$i)."</th>";
	}
	echo "<th> Total </th>";
	?>
	</tr>
	
	<tr>
	<?php 
	$sum = 0;
	for ($i = 0 ; $i < count ($sizes); $i++) {
		if (substr($model_sizes,$i,1)=="1") {
			$sizeModel = SsSizeQty::model()->findByAttributes(array('ss_id'=>$model->ss_id, 'size'=>$sizes[$i]));
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
</table>

<br/>
<table class="header3" >
	<tr>
		<th> BOM/BOQ </th>
		<th> <?php echo $model->seasons[$model->season]." (".$model->year.") ";?> </th>
		<th> <?php echo $model->brand;?> </th>
		<th> <?php echo $model->style_code;?> </th>
		<th> <?php echo $model->pono;?>  </th>
	</tr>
</table>
<table class="items">
	<tr>
		<?php 
		foreach ($attributes as $att) {
			echo "<th>".$ss_bom->attributeLabels()[$att]."</th>";
		}
		?>
		
	</tr>
	
		<?php 
		foreach ($bomItems as $models) {
			foreach ($models as $model) {
				echo "<tr>";
				foreach ($attributes as $att) {
					echo "<td>".$model[$att]."</td>";
				}
				echo "</tr>";
			}
		}
		
		?>
</table>

<table class="items">
	<tr>
		<th> باقي الاكسسوارات توريد المورد</th>
	</tr>
</table>
