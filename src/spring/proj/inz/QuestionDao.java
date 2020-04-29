package com.tognyp.springsecurity.demo.dao;

import com.tognyp.springsecurity.demo.entity.Question;

public interface QuestionDao {
	
	public void save(Question theQuestion, Long questionnaireId);

}
