package com.josephrexrode.psychswipe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.repositories.PatientRepository;

@Service
public class PatientService {

	@Autowired
	PatientRepository pRepo;
	
	// CRUD METHODS //
	
		// create
	
		public Patient create(Patient p) {
			return pRepo.save(p);
		}
		
		
}
