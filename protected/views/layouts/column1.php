<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div id="content">
	<?php if(Yii::app()->user->hasFlash('error')) { ?>
		<div class="flash-error">
			<?php echo Yii::app()->user->getFlash('error'); ?>
		</div>
	<?php } ?>
	<?php echo $content; ?>
</div><!-- content -->
<?php $this->endContent(); ?>