package com.tognyp.springsecurity.demo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tognyp.springsecurity.demo.entity.Answer;
import com.tognyp.springsecurity.demo.entity.Question;

/**
* DAO implementation of Answer entity use to store data in database
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Repository
public class AnswerDaoImpl implements AnswerDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Answer theAnswer, Long questionId) {
		
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Question tempQuestion = currentSession.get(Question.class, questionId);
		
		theAnswer.setQuestion(tempQuestion);
		
		currentSession.saveOrUpdate(theAnswer);
		
	}
	
	

}
