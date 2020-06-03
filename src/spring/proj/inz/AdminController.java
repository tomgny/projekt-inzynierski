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
import org.springframework.web.bind.annotation.RequestParam;

import com.tognyp.springsecurity.demo.entity.Role;
import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.service.RoleService;
import com.tognyp.springsecurity.demo.service.UserService;
import com.tognyp.springsecurity.demo.user.RoleUser;

/**
* Controller responsible for Admin operation
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Controller
@RequestMapping("/systems")
public class AdminController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	/**
	* Showing users view
	* 
	*
	* @param theModel Model passed to view
	* @return View used to show users
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/showUsers")
	public String showUsers(Model theModel) {
			
		List<User> users = userService.findAllUsers();

		theModel.addAttribute("users", users);

		return "show-users";
	}
	
	/**
	* Showing view used for set user role
	* 
	*
	* @param theModel Model passed to view
	* @param request Http Request to get parameters from view
	* @return View used to set role
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@GetMapping("/setRoles")
	public String setRoles(Model theModel, HttpServletRequest request) {
			
		User user = userService.findByUserName(request.getParameter("username"));
		
		List<Role> theRoles = roleService.findAllRoles();
		
		RoleUser roleUser = new RoleUser();
		
		theModel.addAttribute("roleUser", roleUser);
		theModel.addAttribute("user", user);
		theModel.addAttribute("roles", theRoles);

		return "set-roles";
	}
	
	/**
	* Saving new roles for selected user
	* 
	*
	* @param roleUser Model of wrapper class include necessary data about roles and user
	* @param request Http Request to get parameters from view
	* @return If user has that role, return adding role denied view, otherwise return show users view
	* @version 1.0
	* @since   2020-06-03
	*/
	
	@PostMapping("/saveRoles")
	public String saveRoles(HttpServletRequest request, @ModelAttribute("roleUser") RoleUser roleUser) {
		
		if(!userService.addNewRole(roleUser.getUserName(), roleUser.getRoleName())) {
			return "adding-role-denied";
		}
	
		return "show-users";
	}
	
}
