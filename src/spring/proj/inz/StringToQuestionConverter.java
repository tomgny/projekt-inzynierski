package com.tognyp.springsecurity.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.service.QuestionService;

/**
* Component implements Converter for convert Question to string
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Component
public class StringToQuestionConverter implements Converter<String, Question> {

	@Autowired
	private QuestionService questionService;
	
	/**
	* Convert function
	* 
	*
	* @param source String to convert
	* @return Converted String to Question
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@Override
	public Question convert(final String source) {

		return questionService.getQuestionById(source);
	}

}
