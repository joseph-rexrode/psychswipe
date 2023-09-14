package com.josephrexrode.psychswipe.models;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="providers")
public class Provider {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;
	
	private ArrayList<String> insuranceProvidersAccepted;
	
	private ArrayList<String> statesLicensedIn;
	
	private Boolean provideTelehealth;
	
	public Provider() {}

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

	public ArrayList<String> getInsuranceProvidersAccepted() {
		return insuranceProvidersAccepted;
	}

	public void setInsuranceProvidersAccepted(ArrayList<String> insuranceProvidersAccepted) {
		this.insuranceProvidersAccepted = insuranceProvidersAccepted;
	}

	public ArrayList<String> getStatesLicensedIn() {
		return statesLicensedIn;
	}

	public void setStatesLicensedIn(ArrayList<String> statesLicensedIn) {
		this.statesLicensedIn = statesLicensedIn;
	}

	public Boolean getProvideTelehealth() {
		return provideTelehealth;
	}

	public void setProvideTelehealth(Boolean provideTelehealth) {
		this.provideTelehealth = provideTelehealth;
	}
	
}
