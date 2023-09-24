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
import org.springframework.web.bind.annotation.RequestMapping;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.services.ProviderService;
import com.josephrexrode.psychswipe.services.UserService;

@Controller
@RequestMapping("/provider")
public class ProviderController {
	
	@Autowired
	ProviderService pService;
	
	@Autowired
	UserService uService;

	@PostMapping("/newProvider")
	public String createPatient(
			@Valid @ModelAttribute("newProvider") Provider p,
			BindingResult result,
			Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			
			model.addAttribute("newPatient", new Patient());
			return "/home_first.jsp";
		}
		
		User u = uService.findById((Long) session.getAttribute("loggedUser"));
		
		pService.create(p, u);
		
		return "redirect:/home";
		
	}
	
	@GetMapping("/home")
	public String providerHome(
			Model model,
			HttpSession session) {
		
		return "/providers/home.jsp";
	}
}
