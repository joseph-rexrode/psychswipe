package com.josephrexrode.psychswipe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.repositories.PatientRepository;
import com.josephrexrode.psychswipe.repositories.UserRepository;

@Service
public class PatientService {

	@Autowired
	PatientRepository pRepo;
	
	@Autowired
	UserRepository uRepo;
	
	// CRUD METHODS //
	
		// create
	
		public Patient create(Patient p, User u) {
			
			p.setUser(u);
			return pRepo.save(p);
		}
		
		// read 
		
		public Patient findByUserId(Long id) {
			
			User u = uRepo.findById(id).orElse(null);
			
			return pRepo.findByUser(u).orElse(null);
		}
		
}
