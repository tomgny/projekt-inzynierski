package com.tognyp.springsecurity.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;


import com.tognyp.springsecurity.demo.entity.Response;

/**
* DAO implementation of Role entity use to store data in database
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Repository
public class ResponseDaoImpl implements ResponseDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(List<Response> response) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		for(Response r : response) {
			currentSession.saveOrUpdate(r);
		}

	}

	@Override
	public List<Response> findByUsername(String username, String questionnaireId) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Response> theQuery = currentSession.createQuery("from Response where questionnaire_id=:questionnaireId", Response.class);
		theQuery.setParameter("questionnaireId", questionnaireId);
		
		List<Response> tmpResponses = theQuery.getResultList();
		
		
		List<Response> theResponses = new ArrayList<>();
		BCryptPasswordEncoder checkPassword = new BCryptPasswordEncoder();
		for(Response r : tmpResponses) {
			if(checkPassword.matches(username, r.getUser())) {
				theResponses.add(r);
			}
		}
		
		return theResponses;
		
	}

	@Override
	public List<Response> findByQuestionnaireId(String questionnaireId) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Response> theQuery = currentSession.createQuery("from Response where questionnaire_id=:questionnaireId", Response.class);
		theQuery.setParameter("questionnaireId", questionnaireId);
		
		List<Response> theResponses = theQuery.getResultList();
		
		return theResponses;
		
	}

}
