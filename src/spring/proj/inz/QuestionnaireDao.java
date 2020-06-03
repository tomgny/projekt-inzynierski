package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

/**
* DAO interface of Questionnaire entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuestionnaireDao {
	
	List<Questionnaire> getQuestionnaires();

	Questionnaire findQuestionnaireById(Long id);
	
	void save(Questionnaire questionnaire);
}
