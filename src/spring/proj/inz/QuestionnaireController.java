package com.tognyp.springsecurity.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tognyp.springsecurity.demo.entity.Questionnaire;

import com.tognyp.springsecurity.demo.service.QuesionnaireService;


/**
* Controller responsible for Questionnaire operation
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Controller
@RequestMapping("/questionnaires")
public class QuestionnaireController {
	
	@Autowired
	private QuesionnaireService questionnaireService;
	
	/**
	* Showing view include list of questionnaires
	* 
	*
	* @param theModel Model passed to view
	* @param request Http Request to get parameters from view
	* @return Return Questionnaires view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/show-questionnaire")
	public String showQuestionnaire(HttpServletRequest request, Model model) {
		
		List<Questionnaire> theQuestionnaires = questionnaireService.getQuestionnaires();

		model.addAttribute("questionnaires", theQuestionnaires);
		
		return "show-questionnaire";
	}
	
	/**
	* Showing view used to add new questionnaire
	* 
	*
	* @param theModel Model passed to view
	* @return Return Add questionnaire view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/add-questionnaire")
	public String addQuestionaire(Model theModel){
		Questionnaire theQuestionnaire = new Questionnaire();
		
		theModel.addAttribute("questionnaire", theQuestionnaire);
		
		return "add-questionnaire";
	}
	
	/**
	* Saving questionnaire to database
	* 
	*
	* @param theQuestionnaire Questionnaire model include necessary data
	* @return Redirect to show questionnaire view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@PostMapping("/saveQuestionnaire")
	public String saveQuestionnaire(@ModelAttribute("questionnaire") Questionnaire theQuestionnaire) {
		
		questionnaireService.save(theQuestionnaire);
		
		return "redirect:/questionnaires/show-questionnaire";
	}
}
