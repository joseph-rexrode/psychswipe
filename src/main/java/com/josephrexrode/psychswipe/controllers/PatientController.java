package com.josephrexrode.psychswipe.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.services.PatientService;
import com.josephrexrode.psychswipe.services.ProviderService;
import com.josephrexrode.psychswipe.services.UserService;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	PatientService pService;
	
	@Autowired
	ProviderService prService;
	
	@Autowired
	UserService uService;
	
	@PostMapping("/newPatient")
	public String createPatient(
			@Valid @ModelAttribute("newPatient") Patient p,
			BindingResult result,
			Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			
			model.addAttribute("newProvider", new Provider());
			return "/home_first.jsp";
		}
		
		User u = uService.findById((Long) session.getAttribute("loggedUser"));
		
		pService.create(p, u);
		
		return "redirect:/home";
		
	}
	
	@GetMapping("/home")
	public String patientHome(
			Model model,
			HttpSession session) {
		
		Patient p = pService.findByUserId((Long) session.getAttribute("loggedUser"));
		
		List<Provider> notMatches = prService.notPatientProviders(p);
		
		model.addAttribute("notMatches", notMatches);
		
		return "/home.jsp";
	}
	
	@PutMapping("/{user_id}/match")
	public String match(
			@PathVariable("user_id") Long id,
			@RequestParam(name = "provider") Provider provider,
			Model model) {
		
		Patient p = pService.findByUserId(id);
		
		pService.addMatch(p, provider);
		
		return "redirect:/matches";
	}
	
}
