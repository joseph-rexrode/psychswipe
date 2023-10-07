package com.josephrexrode.psychswipe.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
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
	
		// check session status maybe???
		public Patient create(Patient p, User u) {
			
			p.setUser(u);
			
			return pRepo.save(p);
		}
		
		// read 
		
		public Patient findByUserId(Long id) {
			
			User u = uRepo.findById(id).orElse(null);
			
			return pRepo.findByUser(u).orElse(null);
		}
		
		public List<Provider> findMatches(Patient p) {
			return p.getProviderMatches();
		}
		
		// update 
		
		public Patient update(Patient p) {
			return pRepo.save(p);
		}
		
		public void addMatch(Patient p, Provider pr) {
			p.getProviderMatches().add(pr);
			update(p);
		}
		
		public void removeMatch(Patient p, Provider pr) {
			p.getProviderMatches().remove(pr);
			update(p);
		}
		
}
