package com.tognyp.springsecurity.demo.dao;

import com.tognyp.springsecurity.demo.entity.Answer;

/**
* DAO interface of Answer entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface AnswerDao {
	
	public void save(Answer theAnswer, Long questionId);
	

}
