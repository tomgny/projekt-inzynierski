package com.tognyp.springsecurity.demo.service;

import com.tognyp.springsecurity.demo.entity.Answer;

public interface AnswerService {
	
	public void save(Answer theAnswer, Long questionId);

}
