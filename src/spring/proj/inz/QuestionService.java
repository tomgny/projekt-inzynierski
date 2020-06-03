package com.tognyp.springsecurity.demo.service;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Question;

/**
* Question service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuestionService {
	
	public void save(Question theQuestion, Long questionnaireId);

	public List<Question> getQuestions(int id);
	
	public Question getQuestionById(String id);
}
