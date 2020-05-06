package com.tognyp.springsecurity.demo.dao;

import com.tognyp.springsecurity.demo.entity.Answer;

public interface AnswerDao {
	
	public void save(Answer theAnswer, Long questionId);
	

}
