package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Role;

/**
* DAO interface of Role entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
	List<Role> findAllRoles();
	
}
