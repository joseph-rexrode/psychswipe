package com.josephrexrode.psychswipe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		public Iterable<Provider> findAllProviders() {
			return pRepo.findAll();
		}
}
