package com.josephrexrode.psychswipe.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.repositories.ProviderRepository;
import com.josephrexrode.psychswipe.repositories.UserRepository;

@Service
public class ProviderService {
	
	@Autowired
	ProviderRepository pRepo;
	
	@Autowired
	UserRepository uRepo;

	
	// CRUD Operations
	
		// create
	
		public Provider create(Provider p, User u) {
			p.setUser(u);
			return pRepo.save(p);
		}
		
		// read
		
		public Provider findByUserId(Long id) {
			User u = uRepo.findById(id).orElse(null);
			
			return pRepo.findByUser(u).orElse(null);	
		}
		
		public Provider findById(Long id) {
			return pRepo.findById(id).orElse(null);
		}
		
		public Iterable<Provider> findAllProviders() {
			return pRepo.findAll();
		}
		
		public List<Provider> notPatientProviders(Patient p) {
			
			List<Provider> notMatches = pRepo.findByPatientMatchesNotContains(p);
			
			if (p.getUser().getProvider() != null) {
				notMatches.remove(p.getUser().getProvider());
			}
			
			return notMatches;
		}
}
