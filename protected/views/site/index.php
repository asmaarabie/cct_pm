<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>
<h1>Welcome to <i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1>

<p style='color: red; font-style:oblique '> login with user:admin, pass:admin</p>

Implemented functionalities so far [just for listing purposes]: 
<br/>
DCS names:
		<ul>
			<li><?php echo CHtml::link('Subclass Names', array('subclassName/index'))?></li>
			<li><?php echo CHtml::link('Department Names', array('departmentName/index'))?></li>
			<li><?php echo CHtml::link('DCS Names', array('dCSName/index'))?></li>
		</ul>
<br/>
Color coding:
		<ul>
			<li><?php echo CHtml::link('First color', array('color/index'))?></li>
			<li><?php echo CHtml::link('Second color / shadow', array('colorShadow/index'))?></li>
			<li><?php echo CHtml::link('Color Patterns', array('colorPattern/index'))?></li>
			<li><?php echo CHtml::link('Pattern Shape', array('colorShape/index'))?></li>
			<li><?php echo CHtml::link('Color Length', array('colorLength/index'))?></li>
			<li><?php echo CHtml::link('Color coding', array('colorCode/index'))?></li>
		</ul>
<br/>
Size coding:
		<ul>
			<li><?php echo CHtml::link('Size scale', array('size/index'))?></li>
			<li><?php echo CHtml::link('Attach scale to DCS', array('dCSSizeScale/index'))?></li>
		</ul>
<br/>
ISO Header:
		<ul>
			<li><?php echo CHtml::link('ISO header', array('isoHeader/index'))?></li>
		</ul>
<br/>


<p>For more details on how to further develop this application, please read
the <a href="http://www.yiiframework.com/doc/">documentation</a>.
Feel free to ask in the <a href="http://www.yiiframework.com/forum/">forum</a>,
should you have any questions.</p>
