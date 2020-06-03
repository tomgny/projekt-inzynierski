package com.tognyp.springsecurity.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tognyp.springsecurity.demo.dao.QuestionDao;
import com.tognyp.springsecurity.demo.entity.Question;

/**
* Question service implementation use DAO design pattern
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDao questionDao;

	@Override
	@Transactional
	public void save(Question theQuestion, Long questionnaireId) {
		questionDao.save(theQuestion, questionnaireId);

	}

	@Override
	@Transactional
	public List<Question> getQuestions(int id) {
		return questionDao.getQuestions(id);
	}

	@Override
	@Transactional
	public Question getQuestionById(String id) {
		return questionDao.getQuestionById(id);
	}

}
