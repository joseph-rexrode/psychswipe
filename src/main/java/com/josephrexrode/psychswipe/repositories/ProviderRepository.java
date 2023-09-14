package com.josephrexrode.psychswipe.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josephrexrode.psychswipe.models.Provider;

@Repository
public interface ProviderRepository extends CrudRepository<Provider, Long>{

}
