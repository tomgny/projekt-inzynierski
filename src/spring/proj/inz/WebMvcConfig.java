package com.tognyp.springsecurity.demo.config;

import org.springframework.stereotype.Component;
import org.springframework.context.annotation.Bean;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Component
@EnableSpringDataWebSupport
public class WebMvcConfig extends WebMvcConfigurationSupport{

	@Override
	protected void addFormatters(FormatterRegistry registry) {
		registry.addConverter(stringToQuesitonConverter());
		super.addFormatters(registry);
		
	}
	
	@Bean
	public StringToQuestionConverter stringToQuesitonConverter() {
		return new StringToQuestionConverter();
	}
	
	

}
