package com.tognyp.springsecurity.demo.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
* Class include main app configuration
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public class MySpringMvcDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	/**
	* Root app config
	* 
	*
	* 
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	* Servlet classes config
	* 
	*
	* 
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {AppConfig.class};
	}
	
	/**
	* Servlet mapping config
	* 
	*
	* 
	* @version 1.0
	* @since   2020-06-03
	*/

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}

}
