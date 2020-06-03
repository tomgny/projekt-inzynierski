package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.QuestionnaireUser;

/**
* QuestionnaireUser service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuestionnaireUserService {
	void save(QuestionnaireUser questionnaireUser);
	
	List<QuestionnaireUser> isResponded(String userId, String questionnaireId);
	
	List<Long> getRespondedIds(String userId);
}
