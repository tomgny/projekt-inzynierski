package com.tognyp.springsecurity.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tognyp.springsecurity.demo.dao.QuestionnaireDao;
import com.tognyp.springsecurity.demo.entity.Questionnaire;

@Service
public class QuestionnaireServiceImpl implements QuesionnaireService {
	
	@Autowired
	private QuestionnaireDao questionnaireDao;

	@Override
	@Transactional
	public List<Questionnaire> getQuestionnaires() {
		return questionnaireDao.getQuestionnaires();
	}

	@Override
	@Transactional
	public Questionnaire findQuestionnaireById(Long id) {
		return questionnaireDao.findQuestionnaireById(id);
	}

	@Override
	@Transactional
	public void save(Questionnaire questionnaire) {
		questionnaireDao.save(questionnaire);

	}

}
