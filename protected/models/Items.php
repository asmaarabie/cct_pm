<?php

/**
 * This is the model class for table "items".
 *
 * The followings are the available columns in table 'items':
 * @property string $countryid
 * @property string $itemsid
 * @property string $desc1
 * @property string $desc2
 * @property string $desc3
 * @property string $desc4
 * @property string $itemclass
 * @property string $itemsubclass
 * @property string $itemsize
 * @property string $itemattr
 * @property string $itemupc
 * @property string $itemalu
 * @property string $itemdept
 * @property string $fulldept
 * @property string $aux1
 * @property string $aux2
 * @property string $aux3
 * @property string $aux4
 * @property string $aux5
 * @property string $aux6
 * @property string $aux7
 * @property string $aux8
 * @property string $minqty
 * @property string $maxqty
 * @property string $onhand
 * @property string $onorder
 * @property string $unitcost
 * @property string $unitprice
 * @property string $unitmgnval
 * @property string $unitmgnprc
 * @property string $extcost
 * @property string $extprice
 * @property string $extmgnval
 * @property string $extcost_curr
 * @property string $extprice_curr
 * @property string $extmgnval_curr
 * @property string $vendor
 * @property integer $itemno
 * @property string $stylesid
 * @property string $last_sale
 * @property string $first_rcvd
 * @property string $udf1
 * @property string $udf2
 * @property string $udf3
 * @property string $udf4
 * @property string $last_rcvd
 * @property string $last_markdown
 * @property string $disconn_date
 * @property string $tax_perc
 * @property string $tax_value
 * @property string $unitpricetax
 * @property string $udfdate
 * @property string $firstprice
 * @property string $firstpricetax
 *
 * The followings are the available model relations:
 * @property Bom[] $boms
 */
class Items extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'items';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('countryid, itemsid, minqty, maxqty, onhand, onorder, unitcost, unitprice, unitmgnval, unitmgnprc, extcost, extprice, extmgnval, extcost_curr, extprice_curr, extmgnval_curr', 'required'),
			array('itemno', 'numerical', 'integerOnly'=>true),
			array('countryid', 'length', 'max'=>5),
			array('itemsid, itemupc, itemalu, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, stylesid, udf1, udf2, udf3, udf4', 'length', 'max'=>20),
			array('desc1, desc2, desc3, desc4', 'length', 'max'=>40),
			array('itemclass, itemsubclass, itemdept', 'length', 'max'=>3),
			array('itemsize, itemattr', 'length', 'max'=>8),
			array('fulldept', 'length', 'max'=>9),
			array('minqty, maxqty, onhand, onorder', 'length', 'max'=>11),
			array('unitcost, unitprice, unitmgnval, extcost, extprice, extmgnval, extcost_curr, extprice_curr, extmgnval_curr, tax_value, unitpricetax, firstprice, firstpricetax', 'length', 'max'=>16),
			array('unitmgnprc, vendor, tax_perc', 'length', 'max'=>6),
			array('last_sale, first_rcvd, last_rcvd, last_markdown, disconn_date, udfdate', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('countryid, itemsid, desc1, desc2, desc3, desc4, itemclass, itemsubclass, itemsize, itemattr, itemupc, itemalu, itemdept, fulldept, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, minqty, maxqty, onhand, onorder, unitcost, unitprice, unitmgnval, unitmgnprc, extcost, extprice, extmgnval, extcost_curr, extprice_curr, extmgnval_curr, vendor, itemno, stylesid, last_sale, first_rcvd, udf1, udf2, udf3, udf4, last_rcvd, last_markdown, disconn_date, tax_perc, tax_value, unitpricetax, udfdate, firstprice, firstpricetax', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'boms' => array(self::HAS_MANY, 'Bom', 'itemno'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'countryid' => 'Countryid',
			'itemsid' => 'Itemsid',
			'desc1' => 'Desc1',
			'desc2' => 'Desc2',
			'desc3' => 'Desc3',
			'desc4' => 'Desc4',
			'itemclass' => 'Itemclass',
			'itemsubclass' => 'Itemsubclass',
			'itemsize' => 'Itemsize',
			'itemattr' => 'Itemattr',
			'itemupc' => 'Itemupc',
			'itemalu' => 'Itemalu',
			'itemdept' => 'Itemdept',
			'fulldept' => 'Fulldept',
			'aux1' => 'Aux1',
			'aux2' => 'Aux2',
			'aux3' => 'Aux3',
			'aux4' => 'Aux4',
			'aux5' => 'Aux5',
			'aux6' => 'Aux6',
			'aux7' => 'Aux7',
			'aux8' => 'Aux8',
			'minqty' => 'Minqty',
			'maxqty' => 'Maxqty',
			'onhand' => 'Onhand',
			'onorder' => 'Onorder',
			'unitcost' => 'Unitcost',
			'unitprice' => 'Unitprice',
			'unitmgnval' => 'Unitmgnval',
			'unitmgnprc' => 'Unitmgnprc',
			'extcost' => 'Extcost',
			'extprice' => 'Extprice',
			'extmgnval' => 'Extmgnval',
			'extcost_curr' => 'Extcost Curr',
			'extprice_curr' => 'Extprice Curr',
			'extmgnval_curr' => 'Extmgnval Curr',
			'vendor' => 'Vendor',
			'itemno' => 'Itemno',
			'stylesid' => 'Stylesid',
			'last_sale' => 'Last Sale',
			'first_rcvd' => 'First Rcvd',
			'udf1' => 'Udf1',
			'udf2' => 'Udf2',
			'udf3' => 'Udf3',
			'udf4' => 'Udf4',
			'last_rcvd' => 'Last Rcvd',
			'last_markdown' => 'Last Markdown',
			'disconn_date' => 'Disconn Date',
			'tax_perc' => 'Tax Perc',
			'tax_value' => 'Tax Value',
			'unitpricetax' => 'Unitpricetax',
			'udfdate' => 'Udfdate',
			'firstprice' => 'Firstprice',
			'firstpricetax' => 'Firstpricetax',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('countryid',$this->countryid,true);
		$criteria->compare('itemsid',$this->itemsid,true);
		$criteria->compare('desc1',$this->desc1,true);
		$criteria->compare('desc2',$this->desc2,true);
		$criteria->compare('desc3',$this->desc3,true);
		$criteria->compare('desc4',$this->desc4,true);
		$criteria->compare('itemclass',$this->itemclass,true);
		$criteria->compare('itemsubclass',$this->itemsubclass,true);
		$criteria->compare('itemsize',$this->itemsize,true);
		$criteria->compare('itemattr',$this->itemattr,true);
		$criteria->compare('itemupc',$this->itemupc,true);
		$criteria->compare('itemalu',$this->itemalu,true);
		$criteria->compare('itemdept',$this->itemdept,true);
		$criteria->compare('fulldept',$this->fulldept,true);
		$criteria->compare('aux1',$this->aux1,true);
		$criteria->compare('aux2',$this->aux2,true);
		$criteria->compare('aux3',$this->aux3,true);
		$criteria->compare('aux4',$this->aux4,true);
		$criteria->compare('aux5',$this->aux5,true);
		$criteria->compare('aux6',$this->aux6,true);
		$criteria->compare('aux7',$this->aux7,true);
		$criteria->compare('aux8',$this->aux8,true);
		$criteria->compare('minqty',$this->minqty,true);
		$criteria->compare('maxqty',$this->maxqty,true);
		$criteria->compare('onhand',$this->onhand,true);
		$criteria->compare('onorder',$this->onorder,true);
		$criteria->compare('unitcost',$this->unitcost,true);
		$criteria->compare('unitprice',$this->unitprice,true);
		$criteria->compare('unitmgnval',$this->unitmgnval,true);
		$criteria->compare('unitmgnprc',$this->unitmgnprc,true);
		$criteria->compare('extcost',$this->extcost,true);
		$criteria->compare('extprice',$this->extprice,true);
		$criteria->compare('extmgnval',$this->extmgnval,true);
		$criteria->compare('extcost_curr',$this->extcost_curr,true);
		$criteria->compare('extprice_curr',$this->extprice_curr,true);
		$criteria->compare('extmgnval_curr',$this->extmgnval_curr,true);
		$criteria->compare('vendor',$this->vendor,true);
		$criteria->compare('itemno',$this->itemno);
		$criteria->compare('stylesid',$this->stylesid,true);
		$criteria->compare('last_sale',$this->last_sale,true);
		$criteria->compare('first_rcvd',$this->first_rcvd,true);
		$criteria->compare('udf1',$this->udf1,true);
		$criteria->compare('udf2',$this->udf2,true);
		$criteria->compare('udf3',$this->udf3,true);
		$criteria->compare('udf4',$this->udf4,true);
		$criteria->compare('last_rcvd',$this->last_rcvd,true);
		$criteria->compare('last_markdown',$this->last_markdown,true);
		$criteria->compare('disconn_date',$this->disconn_date,true);
		$criteria->compare('tax_perc',$this->tax_perc,true);
		$criteria->compare('tax_value',$this->tax_value,true);
		$criteria->compare('unitpricetax',$this->unitpricetax,true);
		$criteria->compare('udfdate',$this->udfdate,true);
		$criteria->compare('firstprice',$this->firstprice,true);
		$criteria->compare('firstpricetax',$this->firstpricetax,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Items the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
