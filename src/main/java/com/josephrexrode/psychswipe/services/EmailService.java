package com.josephrexrode.psychswipe.services;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendHtmlEmail(String to) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
				
		message.setFrom(new InternetAddress("jrexrode1998@gmail.com"));
		message.setRecipients(MimeMessage.RecipientType.TO, to);
		message.setSubject("Test email");
		
		String htmlContent = "<h1>Test Spring email</h1>" + 
								"<p>Some other text here</p>";
		
		message.setContent(htmlContent, "text/html; charset=utf-8");
		
		mailSender.send(message);
	}
}
