package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

public interface QuesionnaireService {
	
	List<Questionnaire> getQuestionnaires();

	Questionnaire findQuestionnaireById(int id);
	
	void save(Questionnaire questionnaire);

}
