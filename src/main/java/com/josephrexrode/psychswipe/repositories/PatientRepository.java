package com.josephrexrode.psychswipe.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josephrexrode.psychswipe.models.Patient;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long>{

}
