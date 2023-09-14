package com.josephrexrode.psychswipe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;
import com.josephrexrode.psychswipe.repositories.ProviderRepository;

@Service
public class ProviderService {
	
	@Autowired
	ProviderRepository pRepo;

	
	// CRUD Operations
	
		// create
	
		public Provider create(Provider p, User u) {
			p.setUser(u);
			return pRepo.save(p);
		}
}
