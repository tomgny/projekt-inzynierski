package com.tognyp.springsecurity.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tognyp.springsecurity.demo.entity.Questionnaire;
import com.tognyp.springsecurity.demo.service.QuesionnaireService;

@Controller
@RequestMapping("/questionnaires")
public class QuestionnaireController {
	
	@Autowired
	private QuesionnaireService questionnaireService;
	
	@GetMapping("/show-questionnaire")
	public String showQuestionnaire(Model model) {
		
		List<Questionnaire> theQuestionnaires = questionnaireService.getQuestionnaires();
		
		model.addAttribute("questionnaires", theQuestionnaires);
		
		return "show-questionnaire";
	}
	
	@GetMapping("/add-questionnaire")
	public String addQuestionaire(Model theModel){
		Questionnaire theQuestionnaire = new Questionnaire();
		
		theModel.addAttribute("questionnaire", theQuestionnaire);
		
		return "add-questionnaire";
	}
	
	@PostMapping("/saveQuestionnaire")
	public String saveQuestionnaire(@ModelAttribute("questionnaire") Questionnaire theQuestionnaire) {
		
		questionnaireService.save(theQuestionnaire);
		
		return "redirect:/questionnaire/show-questionnaire";
	}
	
}
