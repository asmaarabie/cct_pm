<head>
<style>
table.items{
    border-collapse: collapse;
    width: 100%
}
table.items, table.items td, table.items th {
    border: 1px solid grey;
}

table.items th, table.sizes th {
	border: solid 1px grey; 
	text-align: center; 
	background: #c9dbed;
	vertical-align: middle
}

</style>
</head>
<?php 
$attributes = array (
		'marker_id',
		'marker_name',
		'width',
		'length',
		'utilization',
		't_size',
		'ratio',
		
		//'owner',
);
$marker= new Marker();
?>

<h1>Stylesheet: <?php echo $model->style_code;?></h1>
<table class="items">
	<tr>
		<?php 
		foreach ($attributes as $att) {
			$der_att = $marker->attributeLabels();
			echo "<th>".$der_att[$att]."</th>";
		}
		?>
		
	</tr>
	
		<?php 
		foreach ($markers as $model) {
				echo "<tr>";
				foreach ($attributes as $att) {
					echo "<td>".$model[$att]."</td>";
				}
				echo "</tr>";
		}
		
		?>
</table>
