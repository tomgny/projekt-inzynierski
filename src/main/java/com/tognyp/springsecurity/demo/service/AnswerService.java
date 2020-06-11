package com.tognyp.springsecurity.demo.service;

import com.tognyp.springsecurity.demo.entity.Answer;

/**
* Answer service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface AnswerService {
	
	void save(Answer theAnswer, Long questionId);

}
