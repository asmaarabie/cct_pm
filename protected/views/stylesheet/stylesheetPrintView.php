<head>
<style>
table.table-acc {
    border-collapse: collapse;
}
table.table-size {
	border-collapse: collapse;
}
table.table-acc, table.table-acc td, table.table-acc th, table.table-size, table.table-size td, table.table-size th {
    border: 1px solid grey;
    margin: 1px;
    padding: 2px;
}

div h4, div p, div h3 {
	padding: 0px; margin: 0px;
}
.text-center {
	text-align: center
}

div.prnt-container {
	border: solid 1px grey; 
	padding: 2px;
	margin: 2px; 
}

.left-container {
	width: 420px; 
	border: solid 1px grey; 
	padding: 1px; 
	margin: 1px; 
}

.right-container {
	width: 330px; 
	border: solid 1px grey; 
	padding: 1px; 
	margin: 1px; 
}

th {
	border: solid 1px grey; 
	text-align: center; 
	background: #c9dbed;
	vertical-align: middle
}

.left-container th {
	width: 420px; 
}
td.left-container {
	margin: 10px 10px 10px 0; 
	border: 1px solid grey;
}

.size-container {
	border: solid 1px grey; 
	text-align: center; 
	background: #c9dbed;
	vertical-align: middle;
	width: 100px;
	margin-right: 20px;
}

td.siz-cont {
	padding: 0px 5px 0px 5px; 
	border: 1px solid grey;
}
</style>
</head>

<?php // :TODO: external styling is not active inside this html2pdf module, I had to do it all inline?>

<p> Serial: <?php echo $model->ss_id;?> </p>
<div class="text-center">
	<h3> STYLE SHEET </h3>
</div>
<div>
	<h4> Brand	:	<?php echo $model->brand?> </h4>
	<h4> Category:	<?php echo $model->category?> </h4>
	<h4> Season	:	<?php echo strtoupper($model->seasons[$model->season]) . " " . $model->year;?> </h4>
</div>
<div class="prnt-container">
	
	<?php // Header Box?>
	<div class="prnt-container">
		<h4> DCS	:	<?php echo $model->dcs; if ($model->dcs_notes != '') echo " - Notes: $model->dcs_notes"?> </h4>
		<h4> FABRIC:	<?php echo $model->fabric?> </h4>
		<h4> DESC1	:	<?php echo $model->desc1;?> </h4>
	</div>
	
	<?php // Floating is not working too :D?>
	
	<table style = "vertical-align: top;">
		<tr> 
			<td class = "left-container"> 
	<?php // | COLORS | ?>
				<table>
					<tr><th><h4> Colors </h4></th></tr>
					<tr><td>
	
						<?php 
						$this->widget('zii.widgets.CListView', array(
						'dataProvider'=>$colors,
						'itemView'=>'_colorsPrintView',
						'summaryText'=>'',
						)); 
						?>
					
					</td></tr>
				</table>
			</td>
			
			<td class ="right-container text-center"> 
	<?php // | Print View Image | ?>
				<?php 
				echo CHtml::image(
					Yii::app()->request->baseUrl.Yii::app()->params["styleSheetImagesUploadUrl"].$image->img_path,
					$image->img_path, array('max-width'=> '330px'));
				?>
			</td>
		</tr>
		<tr>
			<td class = "left-container">
	<?php // | Sizes | ?>
				<table>
					<tr >
					<td class = "size-container "><h4> Sizes </h4></td>
					<?php 
					$options = Size::model()->getScaleSizes($model->scale);
					$sizes = $model->sizes;	
						for ($i = 0 ; $i < count ($options); $i++) {
							$str= "<td class='siz-cont'>".
							CHtml::label ($options[$i], 'label_box'.$i)."<br/>";
							
							if (substr($sizes,$i,1)=="1")
								$str.=CHtml::image (Yii::app()->request->baseUrl.'/images/system-icons/yes.png', "yes", array ("height"=>"10px", "width" => "10px"));
							else 
								$str.=CHtml::image (Yii::app()->request->baseUrl.'/images/system-icons/no.png', "yes", array ("height"=>"10px", "width" => "10px"));
							
							$str.="</td>";
							echo  $str;
						}
					?>
					</tr>
				</table>
			</td>
	<?php // | Style Code | ?>
			<th  class = "right-container"> 
				<h4> <?php echo $model->style_code;?> </h4> 
			</th>
		</tr>
	</table>
	
	<?php // | Notes | ?>
	<div class="prnt-container">
		<span> Notes:</span>
		<div> <?php echo $model->stylesheet_note;?>  </div>
	</div>
	
	<?php // | Trims and accessories | ?>
	<div class="prnt-container text-center " >
		<?php echo "TRIMS & ACCESSORIES"; ?>
	</div>
	
	<table style="width: 100%" class ="table-acc">
		<tr> 
			<th> ITEM </th>
			<th> CODE </th>
			<th> COLOR</th>
			<th> DESCRIPTION</th>
			<th> CONS</th>
			<th> PLACEMENT</th>
		</tr>
		
		<?php 
			foreach ($accessories as $item) {
				echo "<tr><td> $item->dcs_name </td><td>";
						echo $item->fulldept;
					echo "</td><td>";
						echo $item->item_color_id;
					echo "</td><td>";
						echo $item->item_desc;
					echo "</td><td>";
						echo $item->item_cons;
					echo "</td><td>";
						echo $item->item_placement;
					echo "</td>";
				echo "</tr>";
			}
		
		?>
	</table>
</div>