package com.tognyp.springsecurity.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tognyp.springsecurity.demo.entity.QuestionnaireUser;
import com.tognyp.springsecurity.demo.entity.Response;

/**
* DAO implementation of Questionnaire entity use to store data in database
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Repository
public class QuestionnaireUserDaoImpl implements QuestionnaireUserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(QuestionnaireUser questionnaireUser) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(questionnaireUser);

	}

	@Override
	public List<QuestionnaireUser> isResponded(String userId, String questionnaireId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<QuestionnaireUser> theQuery = currentSession.createQuery("from QuestionnaireUser where user_id=:userId and questionnaire_id=:questionnaireId", QuestionnaireUser.class);
		theQuery.setParameter("userId", userId);
		theQuery.setParameter("questionnaireId", questionnaireId);
		
		List<QuestionnaireUser> tmpResponses = theQuery.getResultList();
		
		return tmpResponses;
	}

	@Override
	public List<Long> getRespondedIds(String userId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Long> theQuery = currentSession.createQuery("SELECT q.questionnaireId FROM QuestionnaireUser q where user_id=:userId", Long.class);
		theQuery.setParameter("userId", userId);
		
		List<Long> tmpResponses = theQuery.getResultList();

		return tmpResponses;
	}

}
