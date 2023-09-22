package com.josephrexrode.psychswipe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class PsychSwipeApplication {

	public static void main(String[] args) {
		SpringApplication.run(PsychSwipeApplication.class, args);
	}

}
