package com.tognyp.springsecurity.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tognyp.springsecurity.demo.dao.QuestionnaireUserDao;
import com.tognyp.springsecurity.demo.entity.QuestionnaireUser;

/**
* QuestionnaireUser service implementation use DAO design pattern
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Service
public class QuestionnaireUserServiceImpl implements QuestionnaireUserService {

	@Autowired
	private QuestionnaireUserDao questionnaireUserDao;
	
	@Override
	@Transactional
	public void save(QuestionnaireUser questionnaireUser) {
		questionnaireUserDao.save(questionnaireUser);

	}

	@Override
	@Transactional
	public List<QuestionnaireUser> isResponded(String userId, String questionnaireId) {
		return questionnaireUserDao.isResponded(userId, questionnaireId);
	}

	@Override
	@Transactional
	public List<Long> getRespondedIds(String userId) {
		return questionnaireUserDao.getRespondedIds(userId);
	}

}
