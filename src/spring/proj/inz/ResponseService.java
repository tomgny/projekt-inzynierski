package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Response;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.user.ResponsesViewModel;

/**
* Response service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface ResponseService {

	void save(ResponsesViewModel responsesViewModel, User user, String passwd);
	
	List<Response> findByUsername(String username, String questionnaireId);
}
