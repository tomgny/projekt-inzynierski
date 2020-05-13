package com.tognyp.springsecurity.demo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tognyp.springsecurity.demo.entity.Response;

@Repository
public class ResponseDaoImpl implements ResponseDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Response response) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(response);

	}

}
