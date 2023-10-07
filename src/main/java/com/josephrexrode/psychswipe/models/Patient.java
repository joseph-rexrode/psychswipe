package com.josephrexrode.psychswipe.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "patients")
public class Patient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "matches",
			joinColumns = @JoinColumn(name = "patient_id"),
			inverseJoinColumns = @JoinColumn(name = "provider_id"))
	private List<Provider> providerMatches;
	
	private String insuranceProvider;
	
	private Boolean insuranceRequirement;
	
	private Boolean openToTelehealth;
	
	private String stateOfResidence;
	
	public Patient() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getInsuranceProvider() {
		return insuranceProvider;
	}

	public void setInsuranceProvider(String insuranceProvider) {
		this.insuranceProvider = insuranceProvider;
	}

	public Boolean getInsuranceRequirement() {
		return insuranceRequirement;
	}

	public void setInsuranceRequirement(Boolean insuranceRequirement) {
		this.insuranceRequirement = insuranceRequirement;
	}

	public Boolean getOpenToTelehealth() {
		return openToTelehealth;
	}

	public void setOpenToTelehealth(Boolean openToTelehealth) {
		this.openToTelehealth = openToTelehealth;
	}

	public String getStateOfResidence() {
		return stateOfResidence;
	}

	public void setStateOfResidence(String stateOfResidence) {
		this.stateOfResidence = stateOfResidence;
	}

	public List<Provider> getProviderMatches() {
		return providerMatches;
	}

	public void setProviderMatches(List<Provider> providerMatches) {
		this.providerMatches = providerMatches;
	}
}
