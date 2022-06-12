package com.test.mybatis;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

public class MailHandler
{
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		try
		{
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void setSubject(String subject) throws MessagingException {
		try
		{
			messageHelper.setSubject(subject);
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void setText(String htmlContent) throws MessagingException {
		try
		{
			messageHelper.setText(htmlContent, true);
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		try
		{
			messageHelper.setFrom(email, name);
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void setTo(String email) throws MessagingException {
		try
		{
			messageHelper.setTo(email);
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		try
		{
			messageHelper.addInline(contentId, dataSource);
		} catch (javax.mail.MessagingException e)
		{
			e.printStackTrace();
		}
	}

	public void send() {
		mailSender.send(message);
	}
}
