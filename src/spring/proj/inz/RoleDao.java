package com.tognyp.springsecurity.demo.dao;

import com.tognyp.springsecurity.demo.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
