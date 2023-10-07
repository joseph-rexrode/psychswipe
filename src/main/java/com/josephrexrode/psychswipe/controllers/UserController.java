package com.josephrexrode.psychswipe.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.josephrexrode.psychswipe.models.LoginUser;
import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.services.PatientService;
import com.josephrexrode.psychswipe.services.ProviderService;
import com.josephrexrode.psychswipe.services.UserService;
import com.josephrexrode.psychswipe.statics.Statics;
import com.josephrexrode.psychswipe.utilities.FileUploadUtil;

@Controller
public class UserController {
	
	@Autowired
	UserService uService;
	
	@Autowired
	ProviderService prService;
	
	@Autowired
	PatientService paService;
	
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
			return "/index.jsp";
		}
		
		User user = uService.login(newLogin, result);
		
		if (user == null) {
			model.addAttribute("newUser", new User());
			return "/index.jsp";
		}
		
		session.setAttribute("loggedUser", user);
		
		
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
			return "redirect:/logout";
		}
		
		model.addAttribute("loggedUser", session.getAttribute("loggedUser"));
		
		User user = (User) session.getAttribute("loggedUser");
				
		// No patient or provider profiles created yet
		
		if (user.getPatient() == null && user.getProvider() == null) {	
			
			Statics s = new Statics();
			
			List<String> states = s.getStates();
			List<String> insuranceProviders = s.getInsuranceProviders();
			
			model.addAttribute("states", states);
			model.addAttribute("insuranceProviders", insuranceProviders);
			model.addAttribute("newPatient", new Patient());
			model.addAttribute("newProvider", new Provider());
			
			return "/home_first.jsp";
		}
		
		// Provider profile created
		
		else if (user.getPatient() == null) {
			
			session.setAttribute("profile", "provider");	
		}
		
		// Either patient profile created, or both profiles created
				
		else {	
			model.addAttribute("allProviders", prService.findAllProviders());
			
			// this assumes it's a log-in 
			// rather than someone navigating to the home page while already logged in
			if (session.getAttribute("profile") == null) {
				session.setAttribute("profile", "patient");
			}
		}
		
		
		return "redirect:/" + session.getAttribute("profile") + "/home";
	}
	
	@GetMapping("/switch")
	public String switchProfile(
			Model model,
			HttpSession session) {
		
		session.setAttribute("profile", session.getAttribute("profile").toString().compareTo("patient") == 0 ? "provider" : "patient");
		
		return "redirect:/" + session.getAttribute("profile") + "/home";
	}
	
	// UPDATE PROFILE //
	
	@GetMapping("/profile")
	public String profile(
			@ModelAttribute("newPatient") Patient newPatient,
			@ModelAttribute("newProvider") Provider newProvider,
			@ModelAttribute("user") User user,
			Model model,
			HttpSession session) throws IOException {
		
		if (session.getAttribute("loggedUser") == null) {
			return "redirect:/logout";
		}
		
		Long id = ((User) session.getAttribute("loggedUser")).getId();
		user = uService.findById(id);
		
		model.addAttribute("user", user);
		
		Provider p = prService.findByUserId(id);
		Patient pa = paService.findByUserId(id);
		Statics s = new Statics();
		
		List<String> states = s.getStates();
		List<String> insuranceProviders = s.getInsuranceProviders();
		
		model.addAttribute("states", states);
		model.addAttribute("insuranceProviders", insuranceProviders);
		model.addAttribute("newPatient", new Patient());
		model.addAttribute("newProvider", new Provider());		
		model.addAttribute("provider", p != null ? true: false);
		model.addAttribute("patient", pa != null ? true: false);
		
		return "/profile.jsp";
	}
	
	
	@PutMapping("/profile/update")
	public String updateProfile(
			@Valid @ModelAttribute("user") User user,
			Model model,
			BindingResult result,
			HttpSession session) {
			
		User u = (User) session.getAttribute("loggedUser");
		
		if (result.hasErrors()) {
			model.addAttribute("user", u);
			
			return "/profile.jsp";
		}
		
		uService.updateProfile(u, user);
		
		
		return "redirect:/profile";
	}
	
	@PutMapping("/profile/update-profile-picture")
	public String updateProfilePicture(
			@RequestParam("image") MultipartFile multipartFile,
			Model model,
			HttpSession session) throws IOException {
		
		User u = (User) session.getAttribute("loggedUser");
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		
		u.setProfilePhoto(fileName);
		
		User savedU = uService.updateProfile(u);
		
		String uploadDirectory = "user-profile-photo/" + savedU.getId();
		
		FileUploadUtil.saveFile(uploadDirectory, fileName, multipartFile);
		
		return "redirect:/profile";
		
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
