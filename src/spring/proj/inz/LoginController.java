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
public class LoginController {
	
	/**
	* Showing login view
	* 
	*
	* @return View used to login
	* @version 1.0
	* @since   2020-06-03
	*/

	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
		return "login";
	}
	
	/**
	* Showing access denied view
	* 
	*
	* @return Access denied view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
		
	}
}
