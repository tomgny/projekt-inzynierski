package com.tognyp.springsecurity.demo.controller;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tognyp.springsecurity.demo.user.QuestUser;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.service.UserService;

/**
* Controller responsible for Registration operation
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Controller
@RequestMapping("/register")
public class RegistrationController {
	
    @Autowired
    private UserService userService;
	
    private Logger logger = Logger.getLogger(getClass().getName());
    
    /**
	* Binding user input
	* 
	*
	* @version 1.0
	* @since   2020-06-03
	*/
    
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	/**
	* Getting view of registration form
	* 
	* @param theModel Model passed to view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {
		
		theModel.addAttribute("questUser", new QuestUser());
		
		return "registration-form";
	}

	/**
	* Process registration form
	*
	* @param theModel Model passed to view
	* @param questionnaireId Parameter received from previous view
	* @param theQuestUser Model of class include data to user register
	* @param theBindingResult Check is valid of binding
	* @return If binding has errors, return to previous view with errors, otherwise return confirmation view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(
				@Valid @ModelAttribute("questUser") QuestUser theQuestUser, 
				BindingResult theBindingResult, 
				Model theModel) {
		
		String userName = theQuestUser.getUserName();
		logger.info("Processing registration form for: " + userName);
		
		// form validation
		 if (theBindingResult.hasErrors()){
			 return "registration-form";
	        }

		// check the database if user already exists
        User existing = userService.findByUserName(userName);
        if (existing != null){
        	theModel.addAttribute("questUser", new QuestUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");
        	return "registration-form";
        }
     // create user account        						
        userService.save(theQuestUser);
        
        logger.info("Successfully created user: " + userName);
        
        return "registration-confirmation";		
	}
}
