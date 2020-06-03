package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.QuestionnaireUser;

/**
* DAO interface of QuestionnaireUer entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuestionnaireUserDao {
	
	void save(QuestionnaireUser questionnaireUser);

	List<QuestionnaireUser> isResponded(String userId, String questionnaireId);
	
	List<Long> getRespondedIds(String userId);

}
