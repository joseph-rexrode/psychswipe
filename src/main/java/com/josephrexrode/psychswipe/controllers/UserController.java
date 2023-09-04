package com.josephrexrode.psychswipe.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.josephrexrode.psychswipe.models.LoginUser;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService uService;
	
	// LOGIN & REGISTRATION //
	
	@GetMapping("/")
	public String index(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		return "/index.jsp";
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "/index.jsp";
		}
		
		User user = uService.register(newUser, result);
		
		if (user == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "/index.jsp";
		}
		
		session.setAttribute("loggedUser", user);
		
		
		return "redirect:/home";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return null;
		}
		
		User user = uService.login(newLogin, result);
		
		if (user == null) {
			model.addAttribute("newUser", new User());
			return null;
		}
		
		session.setAttribute("loggedUser", user);
		
		
		return "redirect:/home";
	}
}
