package com.tognyp.springsecurity.demo.config;

import org.springframework.stereotype.Component;
import org.springframework.context.annotation.Bean;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
* Component responsible for MVC additional config
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Component
@EnableSpringDataWebSupport
public class WebMvcConfig extends WebMvcConfigurationSupport{

	/**
	* Adding converter to configuration
	* 
	*
	* 
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@Override
	protected void addFormatters(FormatterRegistry registry) {
		registry.addConverter(stringToQuesitonConverter());
		super.addFormatters(registry);
		
	}
	
	
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}



	/**
	* Register converter
	* 
	*
	* 
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@Bean
	public StringToQuestionConverter stringToQuesitonConverter() {
		return new StringToQuestionConverter();
	}
	
	

}
