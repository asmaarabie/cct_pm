<h2> Log </h2>
<?php 
$this->widget('zii.widgets.CListView', array(
		'dataProvider'=>$logsDataProvider,
		'itemView'=>"_viewLog",
		'id' => 'ss-log-entry',
));

?>