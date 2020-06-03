package com.tognyp.springsecurity.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
* Controller responsible for Question operation
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Controller
public class HomeController {
	
	/**
	* Showing home page view
	* 
	*
	* @return Home page view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
}
