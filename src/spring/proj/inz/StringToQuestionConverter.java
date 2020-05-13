package com.tognyp.springsecurity.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.service.QuestionService;

@Component
public class StringToQuestionConverter implements Converter<String, Question> {

	@Autowired
	private QuestionService questionService;
	
	@Override
	public Question convert(final String source) {

		return questionService.getQuestionById(source);
	}

}
