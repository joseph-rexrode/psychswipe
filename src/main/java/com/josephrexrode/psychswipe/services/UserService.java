package com.josephrexrode.psychswipe.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.josephrexrode.psychswipe.models.LoginUser;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository uRepo;
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> potentialUser = uRepo.findByEmail(newUser.getEmail());
		
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "Email already in use");
			return null;
		}
		
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "Matches", "Password must match confirm password");
			return null;
		}
		
		String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		
		newUser.setPassword(hashedPassword);
		
		return uRepo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		
		Optional<User> potentialUser = uRepo.findByEmail(newLogin.getEmail());
		
		if (potentialUser.isEmpty()) {
			result.rejectValue("email", "Matches", "Email not recognized!");
			return null;
		}
		
		User user = potentialUser.get();
		
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid password.");
			return null;
		}
		
		return user;
	}
}
