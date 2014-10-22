<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="span-19">
	<div id="content">
		<?php if(Yii::app()->user->hasFlash('error')) { ?>
			<div class="flash-error">
				<?php echo Yii::app()->user->getFlash('error'); ?>
			</div>
		<?php } elseif(Yii::app()->user->hasFlash('success')) { ?>
		<div class="flash-success">
				<?php echo Yii::app()->user->getFlash('success'); ?>
			</div>
		<?php } ?>
		
		<?php echo $content; ?>
	</div><!-- content -->
</div>
<div class="span-5 last">
	<div id="sidebar">
	<?php
		$this->beginWidget('zii.widgets.CPortlet', array(
			'title'=>'Operations',
		));
		$this->widget('zii.widgets.CMenu', array(
			'items'=>$this->menu,
			'htmlOptions'=>array('class'=>'operations'),
		));
		$this->endWidget();
	?>
	</div><!-- sidebar -->
</div>
<?php $this->endContent(); ?>