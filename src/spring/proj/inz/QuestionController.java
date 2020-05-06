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
		System.out.println("title: " + theQuestion.getTitle());
		System.out.println("id: " + theQuestion.getId());
		System.out.println("questionnaireid: " + theQuestion.getQuestionnaire().getId());
		questionService.save(theQuestion, Long.parseLong(temp));
		
		return "redirect:/questionnaires/show-questionnaire";
	}
	
	@GetMapping("/addQuestion")
	public String addQuestion(Model theModel) {
		
		Question tempQuestion = new Question();
		theModel.addAttribute("question", tempQuestion);
		
		return "add-question";
	}
	
	@GetMapping("/showQuestions")
	public String showQuestions(HttpServletRequest request, Model theModel) {
		
		List<Question> questionList = questionService.getQuestions(Integer.parseInt(request.getParameter("questionnaireId")));
		
		theModel.addAttribute("questions", questionList);
		
		return "show-quest";
	}
}
