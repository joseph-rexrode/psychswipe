package com.josephrexrode.psychswipe.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josephrexrode.psychswipe.models.Patient;
import com.josephrexrode.psychswipe.models.Provider;
import com.josephrexrode.psychswipe.models.User;

@Repository
public interface ProviderRepository extends CrudRepository<Provider, Long>{
	
	Optional<Provider> findByUser(User user);
	
	List<Provider> findByPatientMatchesNotContains(Patient p);
}
