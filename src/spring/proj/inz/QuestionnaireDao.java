package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

public interface QuestionnaireDao {
	
	List<Questionnaire> getQuestionnaires();

	Questionnaire findQuestionnaireById(int id);
	
	void save(Questionnaire questionnaire);
}
