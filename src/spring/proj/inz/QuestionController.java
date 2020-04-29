package com.tognyp.springsecurity.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;

	@PostMapping("/saveQuestion")
	//public String saveQuestion(@RequestParam("questionnaireId") Long questionnaireId, @ModelAttribute("question") Question theQuestion) {
	public String saveQuestion(HttpServletRequest request, @ModelAttribute("question") Question theQuestion) {

		String temp = request.getParameter("questionnaire");
		questionService.save(theQuestion, Long.parseLong(temp));
		
		return "redirect:/questionnaire/show-questionnaire";
	}
	
	@GetMapping("/addQuestion")
	public String addQuestion(Model theModel) {
		
		Question tempQuestion = new Question();
		theModel.addAttribute("question", tempQuestion);
		
		return "add-question";
	}
}
