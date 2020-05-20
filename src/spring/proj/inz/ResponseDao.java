package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Response;

public interface ResponseDao {
	
	public void save(Response response);

	public List<Response> findByUsername(String username, String questionnaireId);

}
