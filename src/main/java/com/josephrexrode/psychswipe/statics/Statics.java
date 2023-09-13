package com.josephrexrode.psychswipe.statics;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Statics {
	
	public List<String> getStates() throws IOException {
		
		Resource resource = new ClassPathResource("/static/states.txt");
		File file = resource.getFile();
		BufferedReader bf = new BufferedReader(new FileReader(file));
		
		String line = bf.readLine();
		List<String> states = new ArrayList<String>();
		
		while (line != null) {
			states.add(line);
			line = bf.readLine();
		}
		
		bf.close();
		
		return states;
		
	}
	
	public List<String> getInsuranceProviders() throws IOException {
		Resource resource = new ClassPathResource("/static/insuranceProviders.txt");
		File file = resource.getFile();
		BufferedReader bf = new BufferedReader(new FileReader(file));
		
		String line = bf.readLine();
		List<String> insuranceProviders = new ArrayList<String>();
		
		while (line != null) {
			insuranceProviders.add(line);
			line = bf.readLine();
		}
		
		bf.close();
		
		return insuranceProviders;
	}

}
