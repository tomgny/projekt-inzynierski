package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Question;

/**
* DAO interface of Question entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface QuestionDao {
	
	public void save(Question theQuestion, Long questionnaireId);

	public List<Question> getQuestions(int id);

	public Question getQuestionById(String id);

}
