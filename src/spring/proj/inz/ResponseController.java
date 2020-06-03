package com.tognyp.springsecurity.demo.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tognyp.springsecurity.demo.entity.Question;
import com.tognyp.springsecurity.demo.entity.Questionnaire;
import com.tognyp.springsecurity.demo.entity.QuestionnaireUser;
import com.tognyp.springsecurity.demo.entity.Response;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.service.QuesionnaireService;
import com.tognyp.springsecurity.demo.service.QuestionService;
import com.tognyp.springsecurity.demo.service.QuestionnaireUserService;
import com.tognyp.springsecurity.demo.service.ResponseService;
import com.tognyp.springsecurity.demo.user.QuestResponse;
import com.tognyp.springsecurity.demo.user.ResponsesViewModel;

/**
* Controller responsible for Response operation
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Controller
@RequestMapping("/response")
public class ResponseController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuesionnaireService questionnaireService;
	
	@Autowired
	private ResponseService responseService;
	
	@Autowired
	private QuestionnaireUserService questionnaireUserService;
	
	
	/**
	* Getting view used to response a questionnaire
	* 
	*
	* @param theModel Model passed to view
	* @param request Http Request to get parameters from view
	* @return View responsible for questionnaire response
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/doResponse")
	public String doResponse(Model theModel, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User checkUser = (User)session.getAttribute("user");
		
		if(questionnaireUserService.isResponded(checkUser.getId().toString(), request.getParameter("questionnaireId")).size() > 0) {
			return "denied-response";
		}
		
		ResponsesViewModel responses = new ResponsesViewModel();
		
		Questionnaire theQuestionnaire = new Questionnaire();
		theQuestionnaire = questionnaireService.findQuestionnaireById(Long.parseLong(request.getParameter("questionnaireId")));
		
		Set<Question> theQuestions = theQuestionnaire.getQuestions();
		List<Question> questions = new ArrayList<>();
		
		for(Question q : theQuestions) {
			questions.add(q);
		}
		
		List<QuestResponse> theResponses = new ArrayList<>();
		
		for(int i = 0; i < theQuestions.size(); i++) {
			theResponses.add(new QuestResponse());
		}
		
		responses.setResponses(theResponses);
		
		Collections.sort(questions, new Comparator<Question>() {

			@Override
			public int compare(Question o1, Question o2) {
				return o1.getTitle().compareTo(o2.getTitle());
			}
			
		});

		if (!theModel.containsAttribute("responses")) {
			theModel.addAttribute("responses", responses);
	    }
		if (!theModel.containsAttribute("questions")) {
			theModel.addAttribute("questions", questions);
	    }

		
		
		return "do-response";
	}
	
	/**
	* Saving responses to database
	* 
	*
	* @param theModel Model passed to view
	* @param request Http Request to get parameters from view
	* @param questionnaireId Parameter received from previous view
	* @param theResponses Model of wrapper class include passed list of responses
	* @param result Check is valid of binding
	* @param redirectAttributes Redirecting attributes to view
	* @return If binding has errors, return to previous view with errors, otherwise return Questionnaires view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@PostMapping("/saveResponse")
	public String saveResponse(HttpServletRequest request, Model theModel, @RequestParam(name = "questionnaireId") String questionnaireId,
							   @Valid @ModelAttribute("responses") ResponsesViewModel theResponses, BindingResult result, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			System.out.println(result.toString());
			redirectAttributes.addAttribute("questionnaireId", questionnaireId);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.responses", result);
			redirectAttributes.addFlashAttribute("responses", theResponses);
			return "redirect:/response/doResponse";
		}
		
		
		HttpSession session = request.getSession();
		User username = (User)session.getAttribute("user");
		Long userId = username.getId();
		
		String passToSave = username.getUserName() + request.getParameter("passwd");
		
		QuestionnaireUser questionnaireUser = new QuestionnaireUser();
		questionnaireUser.setUserId(userId);
		questionnaireUser.setQuestionnaireId(Long.parseLong(questionnaireId));
		

		responseService.save(theResponses, username, passToSave);
		
		questionnaireUserService.save(questionnaireUser);
		
		return "redirect:/questionnaires/show-questionnaire";
	}
	
	/**
	* Getting view to input password used to receive user responses
	* 
	* @return View include text field to find user responses
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/getResponses")
	public String getResponses() {
		
		
		return "get-responses";
	}
	
	/**
	* Showing user responses
	* 
	*
	* @param theModel Model passed to view
	* @param request Http Request to get parameters from view
	* @param questionnaireId Parameter received from previous view
	* @param passwd Password
	* @param questionnaireId Questionnaire ID
	* @return View include table of user responses
	* @version 1.0
	* @since   2020-06-03
	*/
	
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
		
		Collections.sort(theResponses, new Comparator<Response>(){

			@Override
			public int compare(Response o1, Response o2) {
				return o1.getQuestionId().compareTo(o2.getQuestionId());
			}
		});
		
		Collections.sort(theQuestions, new Comparator<Question>() {

			@Override
			public int compare(Question o1, Question o2) {
				return o1.getId().compareTo(o2.getId());
			}
			
		});
		
		theModel.addAttribute("responses", theResponses);
		theModel.addAttribute("questions", theQuestions);
		
		return "show-responses";
	}
}
