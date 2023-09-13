package com.josephrexrode.psychswipe.controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.josephrexrode.psychswipe.models.LoginUser;
import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
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
		
		session.setAttribute("loggedUser", user.getId());
		
		
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
			return "/index.jsp";
		}
		
		User user = uService.login(newLogin, result);
		
		if (user == null) {
			model.addAttribute("newUser", new User());
			return "/index.jsp";
		}
		
		session.setAttribute("loggedUser", user.getId());
		
		
		return "redirect:/home";
	}
	
	// HOME SCREEN //
	
	@GetMapping("/home")
	public String home(
			@ModelAttribute("newPatient") Patient newPatient,
			@ModelAttribute("newProvider") Provider newProvider,
			Model model,
			HttpSession session) throws IOException {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		model.addAttribute("loggedUser", session.getAttribute("loggedUser"));
		
		User user = uService.findById((Long) session.getAttribute("loggedUser"));
		
		if (user.getPatient() == null && user.getProvider() == null) {	
			
			Resource resource = new ClassPathResource("/static/states.txt");
			File file = resource.getFile();
			BufferedReader bf = new BufferedReader(new FileReader(file));
			
			String line = bf.readLine();
			List<String> states = new ArrayList<String>();
			
			while (line != null) {
				states.add(line);
				line = bf.readLine();
			}
			
			model.addAttribute("states", states);
			
			return "/home_first.jsp";
		}
		
		else if (user.getPatient() == null) {
			return "/home_provider.jsp";
		}
		
		return "/home.jsp";
	}
	
	// UPDATE PROFILE //
	
	@GetMapping("/profile")
	public String profile(
			@ModelAttribute("user") User user,
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		Long id = (Long) session.getAttribute("loggedUser");
		user = uService.findById(id);
		model.addAttribute("user", user);
		
		return "/profile.jsp";
	}
	
	
	@PutMapping("/profile/update")
	public String updateProfile(
			@Valid @ModelAttribute("user") User user,
			Model model,
			BindingResult result,
			HttpSession session) {
			
		User u = uService.findById((Long) session.getAttribute("loggedUser"));
		
		if (result.hasErrors()) {
			model.addAttribute("user", u);
			
			return "/profile.jsp";
		}
		
		uService.updateProfile(u, user);
		
		
		return "redirect:/profile";
	}
	
	// MATCHES //
	
	@GetMapping("/matches")
	public String matches(
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		return "/matches.jsp";
	}
	
	// LOGOUT //
	
	@GetMapping("/logout")
	public String logout(
			HttpSession session,
			Model model) {
		
		session.invalidate();
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/index.jsp";
	}
}
