package com.tognyp.springsecurity.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tognyp.springsecurity.demo.dao.RoleDao;
import com.tognyp.springsecurity.demo.entity.Role;

/**
* Role service implementation use DAO design pattern
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;

	@Override
	@Transactional
	public Role findRoleByName(String theRoleName) {
		return roleDao.findRoleByName(theRoleName);
	}

	@Override
	@Transactional
	public List<Role> findAllRoles() {
		return roleDao.findAllRoles();
	}

}
