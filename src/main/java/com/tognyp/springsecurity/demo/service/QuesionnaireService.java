package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

/**
* Questionnaire service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuesionnaireService {
	
	List<Questionnaire> getQuestionnaires();

	Questionnaire findQuestionnaireById(Long l);
	
	void save(Questionnaire questionnaire);

}
