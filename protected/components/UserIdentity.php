<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	// List the possible permissions:
	// N.B. Copy is the same as create, and export any view into excel or PDF is the same as view; no need to add extra permissions for them
	// N.B. Who has the CRUD permissions has the 'admin' permission
	// N.B. the order of these permissions is crucial, ;this is the order of checking in the user identity, for user permissions
	protected $permissions = array('view', 'create', 'update', 'delete', 'admin', 'updateOwn', 'deleteOwn' );
	                          
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
			$groupResponsibilites = GroupOperations::model()->findAllByAttributes(array('group_id'=> $record->user_group));
      		
			// Check protected/data/auth.txt and protected/data/auth.php
			foreach ($groupResponsibilites as $resp) {
				foreach ($this->permissions as $i=>$perm) {
					if (substr($resp->permissions, $i, 1) == 1) {
						if(!$auth->isAssigned("{$perm}{$resp->responsibility}",$record->user_id)) {
							if ($auth->assign("{$perm}{$resp->responsibility}",$record->user_id))
								// Save each time 
								Yii::app()->authManager->save();
						}
					}
						
				}
			}
			
			// Saving the authorization data to storage takes time, so after logging, the auth data are not available until
			// it's totally saved on the disk. I didn't find a quick solution for this, so I'm patching it with a sleep (5 seconds) 
			// 5 seconds guarantees that it will be totally saved for small chunck of data (1 user at a time)
			// :TODO: find a real solution for this
			sleep (5);  
            $this->errorCode=self::ERROR_NONE;
        }
        return !$this->errorCode;
        
	}
	
}