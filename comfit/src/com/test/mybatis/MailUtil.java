// 메일 유틸 클래스

package com.test.mybatis;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

public class MailUtil {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailUtil(JavaMailSender mailSender) throws MessagingException, javax.mail.MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void setSubject(String subject) throws MessagingException, javax.mail.MessagingException {
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException, javax.mail.MessagingException {
		messageHelper.setText(htmlContent, true);
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException, javax.mail.MessagingException {
		messageHelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException, javax.mail.MessagingException {
		messageHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException, javax.mail.MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}

	public void send() {
		mailSender.send(message);
	}

}