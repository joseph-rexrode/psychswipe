package com.josephrexrode.psychswipe.utilities;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry reg) {
		exposeDirectory("user-profile-photo", reg);
	}
	
	private void exposeDirectory(String directoryName,
								ResourceHandlerRegistry reg) {
		
		Path uploadDirectory = Paths.get(directoryName);
		String uploadPath = uploadDirectory.toFile().getAbsolutePath();
		
		if (directoryName.startsWith("../")) {
			directoryName = directoryName.replace("../", "");
		}
		
		reg.addResourceHandler("/" + directoryName + "/**").addResourceLocations("file://" + uploadPath + "/");
		
	}
}
