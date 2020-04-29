package com.tognyp.springsecurity.demo.service;

import com.tognyp.springsecurity.demo.entity.Question;

public interface QuestionService {
	
	public void save(Question theQuestion, Long questionnaireId);

}
