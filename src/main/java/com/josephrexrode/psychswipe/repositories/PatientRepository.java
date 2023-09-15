package com.josephrexrode.psychswipe.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.User;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long>{

	Optional<Patient> findByUser(User user);
}
