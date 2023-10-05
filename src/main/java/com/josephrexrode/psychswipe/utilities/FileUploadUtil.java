package com.josephrexrode.psychswipe.utilities;

import java.io.*;
import java.nio.file.*;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	public static void saveFile(String uploadDirectory, String fileName,
								MultipartFile multipartFile) throws IOException {
		
		Path uploadPath = Paths.get(uploadDirectory);
		
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		
		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException ioE) {
			throw new IOException("Could not save image file: " + fileName, ioE);
		}
	}
}
