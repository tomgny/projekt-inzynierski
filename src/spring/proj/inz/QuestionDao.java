package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Question;

public interface QuestionDao {
	
	public void save(Question theQuestion, Long questionnaireId);

	public List<Question> getQuestions(int id);

}
