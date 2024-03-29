package com.josephrexrode.psychswipe.controllers;

import java.util.List;

import javax.mail.MessagingException;
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
import com.josephrexrode.psychswipe.services.EmailService;
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
	
	@Autowired
	EmailService eService;
	
	@PostMapping("/newPatient")
	public String createPatient(
			@Valid @ModelAttribute("newPatient") Patient p,
			BindingResult result,
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		if (result.hasErrors()) {
			
			model.addAttribute("newProvider", new Provider());
			return "/home_first.jsp";
		}
		
		User u = (User) session.getAttribute("loggedUser");
		
		pService.create(p, u);
		
		return "redirect:/home";
		
	}
	
	@GetMapping("/home")
	public String patientHome(
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		if (session.getAttribute("profile").toString().compareTo("provider") == 0) {
			return "redirect:/provider/home";
		}
		
		Patient p = pService.findByUserId(((User) session.getAttribute("loggedUser")).getId());
		
		List<Provider> notMatches = prService.notPatientProviders(p);
		
		model.addAttribute("notMatches", notMatches);
		
		return "/patients/home.jsp";
	}
	
	@PutMapping("/{user_id}/match")
	public String match(
			@PathVariable("user_id") Long id,
			@RequestParam(name = "provider") Provider provider,
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		Patient p = pService.findByUserId(id);
		
		pService.addMatch(p, provider);
		
		return "redirect:/patient/matches";
	}
	
	@PutMapping("/{user_id}/{provider_id}/unmatch")
	public String unmatch(
			@PathVariable("user_id") Long uid,
			@PathVariable("provider_id") Long pid,
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		Patient p = pService.findByUserId(uid);
		Provider pr = prService.findById(pid);
		
		pService.removeMatch(p, pr);
		
		return "redirect:/patient/matches";
	}
	
	@GetMapping("/matches")
	public String seeMatches(
			Model model,
			HttpSession session) {
	
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		if (session.getAttribute("profile").toString().compareTo("provider") == 0) {
			return "redirect:/provider/home";
		}
		
		Patient p = pService.findByUserId(((User) session.getAttribute("loggedUser")).getId());
		
		model.addAttribute("matches", pService.findMatches(p));
		
		return "/patients/matches.jsp";
	}
	
	@GetMapping("/matches/{provider_id}")
	public String previewProvider(
			@PathVariable("provider_id") Long pid,
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		if (session.getAttribute("profile").toString().compareTo("provider") == 0) {
			return "redirect:/provider/home";
		}
		
		Provider pr = prService.findById(pid);
		
		model.addAttribute("provider", pr);
		
		return "/patients/providerPreview.jsp";
	}
	
	@GetMapping("/email/{provider_id}")
	public String emailProvider(
			@PathVariable("provider_id") Long pid,
			Model model,
			HttpSession session) throws MessagingException {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/";
		}
		
		if (session.getAttribute("profile").toString().compareTo("provider") == 0) {
			return "redirect:/provider/home";
		}
		
		String providerEmail = uService.findById(pid).getEmail();
		
		eService.sendHtmlEmail(providerEmail);
		
		return "/patients/providerPreview.jsp";
		
	}
}
