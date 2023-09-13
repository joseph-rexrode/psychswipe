package com.josephrexrode.psychswipe.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "patients")
public class Patient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;
	
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
}
