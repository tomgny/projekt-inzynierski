package com.tognyp.springsecurity.demo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.entity.Questionnaire;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Question theQuestion, Long questionnaireId) {
		
		Session session = sessionFactory.getCurrentSession();
		Questionnaire tempQuestionnaire = session.get(Questionnaire.class, questionnaireId);
		theQuestion.setQuestionnaire(tempQuestionnaire);
		
		session.saveOrUpdate(theQuestion);

	}

}
