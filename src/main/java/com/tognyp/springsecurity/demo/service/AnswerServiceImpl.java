package com.tognyp.springsecurity.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tognyp.springsecurity.demo.dao.AnswerDao;
import com.tognyp.springsecurity.demo.entity.Answer;

/**
* Answer service implementation use DAO design pattern
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDao answerDao;
	
	
	@Override
	@Transactional
	public void save(Answer theAnswer, Long questionId) {
		answerDao.save(theAnswer, questionId);
		
	}

}
