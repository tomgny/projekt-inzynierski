package com.tognyp.springsecurity.demo.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tognyp.springsecurity.demo.entity.Answer;
import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.entity.Questionnaire;
import com.tognyp.springsecurity.demo.entity.Response;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.service.AnswerService;
import com.tognyp.springsecurity.demo.service.QuesionnaireService;
import com.tognyp.springsecurity.demo.service.QuestionService;
import com.tognyp.springsecurity.demo.service.ResponseService;

@Controller
@RequestMapping("/response")
public class ResponseController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuesionnaireService questionnaireService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private ResponseService responseService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/doResponse")
	public String doResponse(Model theModel, HttpServletRequest request) {
		
		Response theResponse = new Response();
		
		Questionnaire theQuestionnaire = new Questionnaire();
		theQuestionnaire = questionnaireService.findQuestionnaireById(Long.parseLong(request.getParameter("questionnaireId")));
		
		Set<Question> theQuestions = theQuestionnaire.getQuestions();
		//Set<Response> theResponses = new HashSet<>();
		//for(int i = 1; i < theQuestions.size()+1; i++) {
		//	theModel.addAttribute("response" + i, theResponse);
		//}
		
		theModel.addAttribute("response", theResponse);
		theModel.addAttribute("questions", theQuestions);
		
		/*
		Questionnaire theQuestionnaire = new Questionnaire();
		theQuestionnaire = questionnaireService.findQuestionnaireById(Long.parseLong(request.getParameter("questionnaireId")));
		
		Set<Question> theQuestions = theQuestionnaire.getQuestions();
		
		theModel.addAttribute("questionnaire", theQuestionnaire);
		theModel.addAttribute("questions", theQuestions);
		for(Question q : theQuestions) {
			theModel.addAttribute("answers" + i, q.getAnswers());
			i++;
		}
		*/ //dodaæ do response ?
		
		return "do-response";
	}
	
	@PostMapping("/saveResponse")
	public String saveResponse(HttpServletRequest request, Model theModel, Authentication authentication, @ModelAttribute("response") Response theResponse, BindingResult result) {
		if(result.hasErrors()) {
			result.getAllErrors();
		}
		
		
		HttpSession session = request.getSession();
		User username = (User)session.getAttribute("user");
		//theResponse.setQuestionnaireId(Long.parseLong(request.getParameter("questionnaireId")));
		//theResponse.setQuestionId(Long.parseLong(request.getParameter("questionId")));
		theResponse.setUser(passwordEncoder.encode(username.getUserName()));
		System.out.println("response id: " + theResponse.getId());
		System.out.println("response text: " + theResponse.getText());
		System.out.println("response id question: " + theResponse.getQuestionId());
		System.out.println("response id questionnaire: " + theResponse.getQuestionnaireId());
		System.out.println("response user: " + theResponse.getUser());
		System.out.println("request param questionId" + request.getParameter("questionId"));
		
		//responseService.save(theResponse);
		
		return "redirect:/questionnaires/show-questionnaire";
	}
}
