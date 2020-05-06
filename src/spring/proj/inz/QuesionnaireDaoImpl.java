package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

@Repository
public class QuesionnaireDaoImpl implements QuestionnaireDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Questionnaire findQuestionnaireById(Long id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Questionnaire tempQuestionnaire = null;
		
		tempQuestionnaire = currentSession.get(Questionnaire.class, id);
		
		return tempQuestionnaire;
	}

	@Override
	public void save(Questionnaire questionnaire) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(questionnaire);
		
	}

	@Override
	public List<Questionnaire> getQuestionnaires() {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Questionnaire> theQuery = currentSession.createQuery("from Questionnaire", Questionnaire.class);
		
		List<Questionnaire> tempList = theQuery.getResultList();
		
		return tempList;
	}

}
