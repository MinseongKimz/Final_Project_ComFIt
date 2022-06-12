package com.test.mybatis;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Maillog
{
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "auth.action" ,method = RequestMethod.GET)
	public void auth()
	{
		String from  = "comfit0612@naver.com";
		String to  = "hjui78@naver.com";
		String subject = "[Comfit] 이메일 인증 메일입니다.";
		String content = "ㅇㄴㅁㄹㅇㄴㄹ";
		
		try
		{
			MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
			mailSender.send(mail);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
	}

}
