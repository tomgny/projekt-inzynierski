package com.tognyp.springsecurity.demo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tognyp.springsecurity.demo.dao.QuestionDao;
import com.tognyp.springsecurity.demo.entity.Question;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDao questionDao;

	@Override
	@Transactional
	public void save(Question theQuestion, Long questionnaireId) {
		questionDao.save(theQuestion, questionnaireId);

	}

}