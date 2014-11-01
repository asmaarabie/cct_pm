<?php

/**
 * This is the model class for table "customers".
 *
 * The followings are the available columns in table 'customers':
 * @property string $countryid
 * @property string $custsid
 * @property string $compname
 * @property string $titlename
 * @property string $forename
 * @property string $surname
 * @property string $addr1
 * @property string $addr2
 * @property string $addr3
 * @property string $pcode
 * @property string $telno1
 * @property string $telno2
 * @property string $email
 * @property string $storeid
 * @property string $last_sale
 * @property string $latitude
 * @property string $longitude
 * @property string $gender
 * @property string $udf1
 * @property string $udf2
 * @property string $udf3
 * @property string $udf4
 * @property string $udf5
 * @property string $udf6
 * @property string $udf7
 * @property string $udf8
 * @property integer $custid
 * @property string $info1
 * @property string $info2
 * @property string $storecr
 * @property string $credlim
 * @property string $credusd
 * @property string $mark1
 * @property string $mark2
 * @property string $active_flag
 * @property string $aux1
 * @property string $aux2
 * @property string $aux3
 * @property string $aux4
 * @property string $aux5
 * @property string $aux6
 * @property string $aux7
 * @property string $aux8
 * @property string $aux9
 * @property string $aux10
 * @property string $aux11
 * @property string $aux12
 *
 * The followings are the available model relations:
 * @property Bom[] $boms
 */
class Customers extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'customers';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('countryid, custsid', 'required'),
			array('custid', 'numerical', 'integerOnly'=>true),
			array('countryid, storeid', 'length', 'max'=>5),
			array('custsid, pcode, udf3, udf4, udf5, udf6, udf7, udf8, info1, info2, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, aux9, aux10, aux11, aux12', 'length', 'max'=>20),
			array('compname', 'length', 'max'=>25),
			array('titlename', 'length', 'max'=>15),
			array('forename, surname, telno1, telno2', 'length', 'max'=>30),
			array('addr1, addr2, addr3', 'length', 'max'=>40),
			array('email', 'length', 'max'=>255),
			array('latitude, longitude', 'length', 'max'=>12),
			array('gender, active_flag', 'length', 'max'=>1),
			array('storecr, credlim, credusd', 'length', 'max'=>16),
			array('mark1, mark2', 'length', 'max'=>4),
			array('last_sale, udf1, udf2', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('countryid, custsid, compname, titlename, forename, surname, addr1, addr2, addr3, pcode, telno1, telno2, email, storeid, last_sale, latitude, longitude, gender, udf1, udf2, udf3, udf4, udf5, udf6, udf7, udf8, custid, info1, info2, storecr, credlim, credusd, mark1, mark2, active_flag, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, aux9, aux10, aux11, aux12', 'safe', 'on'=>'search'),
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
			'boms' => array(self::HAS_MANY, 'Bom', 'pono'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'countryid' => 'Countryid',
			'custsid' => 'Custsid',
			'compname' => 'Compname',
			'titlename' => 'Titlename',
			'forename' => 'Forename',
			'surname' => 'Surname',
			'addr1' => 'Addr1',
			'addr2' => 'Addr2',
			'addr3' => 'Addr3',
			'pcode' => 'Pcode',
			'telno1' => 'Telno1',
			'telno2' => 'Telno2',
			'email' => 'Email',
			'storeid' => 'Storeid',
			'last_sale' => 'Last Sale',
			'latitude' => 'Latitude',
			'longitude' => 'Longitude',
			'gender' => 'Gender',
			'udf1' => 'Udf1',
			'udf2' => 'Udf2',
			'udf3' => 'Udf3',
			'udf4' => 'Udf4',
			'udf5' => 'Udf5',
			'udf6' => 'Udf6',
			'udf7' => 'Udf7',
			'udf8' => 'Udf8',
			'custid' => 'Custid',
			'info1' => 'Info1',
			'info2' => 'Info2',
			'storecr' => 'Storecr',
			'credlim' => 'Credlim',
			'credusd' => 'Credusd',
			'mark1' => 'Mark1',
			'mark2' => 'Mark2',
			'active_flag' => 'Active Flag',
			'aux1' => 'Aux1',
			'aux2' => 'Aux2',
			'aux3' => 'Aux3',
			'aux4' => 'Aux4',
			'aux5' => 'Aux5',
			'aux6' => 'Aux6',
			'aux7' => 'Aux7',
			'aux8' => 'Aux8',
			'aux9' => 'Aux9',
			'aux10' => 'Aux10',
			'aux11' => 'Aux11',
			'aux12' => 'Aux12',
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
		$criteria->compare('custsid',$this->custsid,true);
		$criteria->compare('compname',$this->compname,true);
		$criteria->compare('titlename',$this->titlename,true);
		$criteria->compare('forename',$this->forename,true);
		$criteria->compare('surname',$this->surname,true);
		$criteria->compare('addr1',$this->addr1,true);
		$criteria->compare('addr2',$this->addr2,true);
		$criteria->compare('addr3',$this->addr3,true);
		$criteria->compare('pcode',$this->pcode,true);
		$criteria->compare('telno1',$this->telno1,true);
		$criteria->compare('telno2',$this->telno2,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('storeid',$this->storeid,true);
		$criteria->compare('last_sale',$this->last_sale,true);
		$criteria->compare('latitude',$this->latitude,true);
		$criteria->compare('longitude',$this->longitude,true);
		$criteria->compare('gender',$this->gender,true);
		$criteria->compare('udf1',$this->udf1,true);
		$criteria->compare('udf2',$this->udf2,true);
		$criteria->compare('udf3',$this->udf3,true);
		$criteria->compare('udf4',$this->udf4,true);
		$criteria->compare('udf5',$this->udf5,true);
		$criteria->compare('udf6',$this->udf6,true);
		$criteria->compare('udf7',$this->udf7,true);
		$criteria->compare('udf8',$this->udf8,true);
		$criteria->compare('custid',$this->custid);
		$criteria->compare('info1',$this->info1,true);
		$criteria->compare('info2',$this->info2,true);
		$criteria->compare('storecr',$this->storecr,true);
		$criteria->compare('credlim',$this->credlim,true);
		$criteria->compare('credusd',$this->credusd,true);
		$criteria->compare('mark1',$this->mark1,true);
		$criteria->compare('mark2',$this->mark2,true);
		$criteria->compare('active_flag',$this->active_flag,true);
		$criteria->compare('aux1',$this->aux1,true);
		$criteria->compare('aux2',$this->aux2,true);
		$criteria->compare('aux3',$this->aux3,true);
		$criteria->compare('aux4',$this->aux4,true);
		$criteria->compare('aux5',$this->aux5,true);
		$criteria->compare('aux6',$this->aux6,true);
		$criteria->compare('aux7',$this->aux7,true);
		$criteria->compare('aux8',$this->aux8,true);
		$criteria->compare('aux9',$this->aux9,true);
		$criteria->compare('aux10',$this->aux10,true);
		$criteria->compare('aux11',$this->aux11,true);
		$criteria->compare('aux12',$this->aux12,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Customers the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
