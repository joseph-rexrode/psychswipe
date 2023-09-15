package com.josephrexrode.psychswipe.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
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
	
	
	@ElementCollection(targetClass = String.class)
	@CollectionTable(name = "insuranceProvidersAccepted", joinColumns = @JoinColumn(name = "user_id"))
	@Column(name = "insuranceProviderAccepted", nullable = false)
	private List<String> insuranceProvidersAccepted = new ArrayList<>();
	
	@ElementCollection(targetClass = String.class)
	@CollectionTable(name = "statesLicensedIn", joinColumns = @JoinColumn(name = "user_id"))
	@Column(name = "stateLicensedIn", nullable = false)
	private List<String> statesLicensedIn = new ArrayList<>();
	
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

	public List<String> getInsuranceProvidersAccepted() {
		return insuranceProvidersAccepted;
	}

	public void setInsuranceProvidersAccepted(List<String> insuranceProvidersAccepted) {
		this.insuranceProvidersAccepted = insuranceProvidersAccepted;
	}

	public List<String> getStatesLicensedIn() {
		return statesLicensedIn;
	}

	public void setStatesLicensedIn(List<String> statesLicensedIn) {
		this.statesLicensedIn = statesLicensedIn;
	}

	public Boolean getProvideTelehealth() {
		return provideTelehealth;
	}

	public void setProvideTelehealth(Boolean provideTelehealth) {
		this.provideTelehealth = provideTelehealth;
	}
	
}
