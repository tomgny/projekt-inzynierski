package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Role;

/**
* Role service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface RoleService {
	
	Role findRoleByName(String theRoleName);
	
	List<Role> findAllRoles();

}
