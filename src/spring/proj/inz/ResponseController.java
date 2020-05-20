package com.tognyp.springsecurity.demo.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.support.Repositories;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tognyp.springsecurity.demo.entity.Answer;
import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.entity.Questionnaire;
import com.tognyp.springsecurity.demo.entity.Response;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.service.AnswerService;
import com.tognyp.springsecurity.demo.service.QuesionnaireService;
import com.tognyp.springsecurity.demo.service.QuestionService;
import com.tognyp.springsecurity.demo.service.ResponseService;
import com.tognyp.springsecurity.demo.user.ResponsesViewModel;

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
		
		
		ResponsesViewModel responses = new ResponsesViewModel();
		
		Questionnaire theQuestionnaire = new Questionnaire();
		theQuestionnaire = questionnaireService.findQuestionnaireById(Long.parseLong(request.getParameter("questionnaireId")));
		
		Set<Question> theQuestions = theQuestionnaire.getQuestions();
		List<Question> questions = new ArrayList<>();
		int tmpCounter = 0;
		for(Question q : theQuestions) {
			questions.add(q);
			System.out.println("add question counter: " + tmpCounter + " question id: " + q.getId());
			tmpCounter++;
		}
		List<Response> theResponses = new ArrayList<>();
		Long tmp1 = (long) 10;
		Long tmp2 = (long) 20;
		for(int i = 0; i < theQuestions.size(); i++) {
			theResponses.add(new Response("test", tmp1, tmp2, "loltekst"));
		}
		responses.setResponses(theResponses);
		System.out.println("responses size: " + responses.getResponses().size());

		theModel.addAttribute("responses", responses);
		theModel.addAttribute("questions", questions);
		
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
	public String saveResponse(HttpServletRequest request, Model theModel, Authentication authentication,
							   @ModelAttribute("responses") ResponsesViewModel theResponses, BindingResult result) {
		
		if(result.hasErrors()) {
			result.getAllErrors();
		}
		
		
		HttpSession session = request.getSession();
		User username = (User)session.getAttribute("user");

		List<Response> responses = theResponses.getResponses();
		System.out.println(theResponses.getResponses());
		String passToSave = username.getUserName() + request.getParameter("passwd");
		System.out.println("passToSave: " + passToSave);
		for(Response r : responses) {
			//r.setUser(passwordEncoder.encode(username.getUserName()));
			System.out.println("response id: " + r.getId());
			System.out.println("response text: " + r.getText());
			System.out.println("response id question: " + r.getQuestionId());
			System.out.println("response id questionnaire: " + r.getQuestionnaireId());
			System.out.println("response user: " + r.getUser());
		}
		
		for(Response r : theResponses.getResponses()) {
			r.setUser(passwordEncoder.encode(passToSave));
			String verification = passToSave + r.getQuestionnaireId() + r.getQuestionId() + r.getText();
			r.setVerification(passwordEncoder.encode(verification));
			responseService.save(r);
		}
		
//		theResponse.setUser(passwordEncoder.encode(username.getUserName()));

		
		//responseService.save(theResponse);
		
		return "redirect:/questionnaires/show-questionnaire";
	}
	
	@GetMapping("/getResponses")
	public String getResponses() {
		
		
		return "get-responses";
	}
	
	@PostMapping("/showResponses")
	public String showResponses(Model theModel, HttpServletRequest request, @RequestParam(name="passwd") String passwd,
								@RequestParam(name="questionnaireId") String questionnaireId) {
		
		
		HttpSession session = request.getSession();
		User username = (User)session.getAttribute("user");
		
		String nameToSearch = username.getUserName() + passwd;
		
		System.out.println("nameToSearch: " + nameToSearch);
		System.out.println("quesionnaireId: " + questionnaireId);
		
		List<Response> theResponses = responseService.findByUsername(nameToSearch, questionnaireId);
		List<Question> theQuestions = questionService.getQuestions(Integer.parseInt(questionnaireId));
		
		theModel.addAttribute("responses", theResponses);
		theModel.addAttribute("questions", theQuestions);
		
		return "show-responses";
	}
}
