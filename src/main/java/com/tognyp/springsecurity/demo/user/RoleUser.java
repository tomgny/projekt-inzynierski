package com.tognyp.springsecurity.demo.user;

/**
* Wrapper class uses to pass model to view 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public class RoleUser {
	
	private String userName;
	
	private String roleName;

	public RoleUser() {
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
