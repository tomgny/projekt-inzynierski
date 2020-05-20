package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Response;

public interface ResponseService {

	void save(Response response);
	
	List<Response> findByUsername(String username, String questionnaireId);
}
