<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>
<h1>Welcome to <i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1>
<?php if (Yii::app()->user->isGuest) 
	echo "Login to see system <span class='login-button'>".CHtml::link('Login', array('color/index'))."</span>";
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewColorCode', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>Color Code</h1>
		<ul>
			<li><?php echo CHtml::link('First color', array('color/index'))?></li>
			<li><?php echo CHtml::link('Second color / shadow', array('colorShadow/index'))?></li>
			<li><?php echo CHtml::link('Color Patterns', array('colorPattern/index'))?></li>
			<li><?php echo CHtml::link('Pattern Shape', array('colorShape/index'))?></li>
			<li><?php echo CHtml::link('Color coding', array('colorCode/index'))?></li>
		</ul>
</div>
<?php 
}
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewDCSName', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>DCS Names</h1>
		<ul>
			<li><?php echo CHtml::link('Subclass Names', array('subclassName/index'))?></li>
			<li><?php echo CHtml::link('Department Names', array('departmentName/index'))?></li>
		</ul>
</div>
<?php 
}
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewSizeScale', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>Size Coding</h1>
		<ul>
			<li><?php echo CHtml::link('Size scale', array('size/index'))?></li>
			<li><?php echo CHtml::link('Attach scale to DCS', array('dCSSizeScale/index'))?></li>
		</ul>
</div>
<?php 
}
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewIsoHeader', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>Iso Header</h1>
		<ul>
			<li><?php echo CHtml::link('ISO header', array('isoHeader/index'))?></li>
		</ul>
</div>
<?php 
}
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewStylesheet', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>Stylesheets</h1>
		<ul>
			<li><?php echo CHtml::link('Stylesheets', array('stylesheet/index'))?></li>
		</ul>
</div>
<?php 
}
?>

<?php 
if (Yii::app()->authManager->checkAccess('viewUsers', Yii::app()->user->id) ||
Yii::app()->authManager->checkAccess('viewGroups', Yii::app()->user->id)) {
?>
<div class = "home-section-container" >
<h1>Users & Groups</h1>
		<ul>
			<?php 
			if (Yii::app()->authManager->checkAccess('viewUsers', Yii::app()->user->id)) {
			?>
			<li><?php echo CHtml::link('Users', array('user/index'))?></li>
			<?php 
			}
			?>
			<?php 
			if (Yii::app()->authManager->checkAccess('viewGroups', Yii::app()->user->id)) {
			?>
			<li><?php echo CHtml::link('Groups', array('group/index'))?></li>
			<?php 
			}
			?>
			
		</ul>
</div>
<?php 
}
?>
