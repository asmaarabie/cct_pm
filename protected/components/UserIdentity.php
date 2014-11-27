<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		$record=User::model()->findByAttributes(array('user_name'=>$this->username));
        if($record===null)
            $this->errorCode=self::ERROR_USERNAME_INVALID;
        else if($record->password!==crypt($this->password,$record->password))
            $this->errorCode=self::ERROR_PASSWORD_INVALID;
        else
        {
            $this->setState('id', $record->user_id);
            $this->setState('group', $record->userGroup->group_name);
            $this->setState('title', $record->user_name);
            $auth=Yii::app()->authManager;

      
            if ($record->user_id == 3) {
            	
	            if(!$auth->isAssigned('adminStylesheet',$record->user_id))
	            {
	            	if($auth->assign('adminStylesheet',$record->user_id))
	            	{
	            		Yii::app()->authManager->save();
	            		//var_dump($auth->isAssigned('adminStylesheet',$record->user_id));
	            		//die();
	            	}
	            }
            }
            $this->errorCode=self::ERROR_NONE;
        }
        return !$this->errorCode;
        
	}
	
}