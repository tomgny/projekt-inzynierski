package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Response;

/**
* DAO interface of Response entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface ResponseDao {
	
	public void save(List<Response> response);

	public List<Response> findByUsername(String username, String questionnaireId);

}
