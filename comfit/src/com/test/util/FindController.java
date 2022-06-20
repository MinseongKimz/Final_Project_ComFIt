package com.test.util;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mybatis.MailAuthKey;
import com.test.mybatis.userDTO;


@Controller
public class FindController
{
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping("/find_email_form.action")
	public String emailSearchForm()
	{
		
		return "/WEB-INF/view/user/main/user_find_email.jsp";
	}
	
	@RequestMapping(value = "/find_email.action", method =  RequestMethod.POST)
	public String emailSearch(Model model, userDTO dto)
	{
		
		//System.out.println(dto.getU_name());
		//System.out.println(dto.getU_tel());
		
		userDTO user = new userDTO();
		try
		{
			SignDAO dao = new SignDAO();
			user = dao.findEmail(dto);

			model.addAttribute("dto", user);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/user/main/user_find_email_success.jsp";
	}
	
	//비밀번호 찾기 눌렀을 때 나오는 입력 폼
	@RequestMapping("/find_pw_form.action")
	public String pwSearchForm()
	{
		return "/WEB-INF/view/user/main/user_find_pw.jsp";
	}
	
	
	// 비밀번호 찾기 해서 정확한 값 넣었다면 이메일 발송, 아니라면 다시 입력
	@RequestMapping(value = "/find_pw.action", method = RequestMethod.POST)
	public String pwSearch(Model model, userDTO dto)
	{
		
		int result = 0;
		try
		{
			SignDAO dao = new SignDAO();
			
			//System.out.println(dto.getU_email());
			//System.out.println(dto.getU_name());
			//System.out.println(dto.getU_tel());
			
			String email = dto.getU_email();
			
			result = dao.findPassword(dto);
			
			if (result!=1) // 찾은 계정이 없다면..
			{
				model.addAttribute("msg", "정보가 올바르지 않습니다.");
				model.addAttribute("url", "find_pw_form.action");
				return "alert.jsp";
			}
			
			// 이메일 인증
			MailAuthKey mak = new MailAuthKey();
			String random = mak.random();
			
			// 인증 키 DB 생성
			dao.makepwAuth(email, random);
			
			String from  = "minseonkimc@gmail.com";
	        String to  = email;
	        String subject = "[Comfit] 비밀번호 변경 안내 메일 입니다.";
	        String content = "<a href='http://localhost:8090/comfit/changepw.action?auth=" +random +"'>COMFIT비밀번호 변경하기</a>";
	          
	        MimeMessage mail = mailSender.createMimeMessage(); MimeMessageHelper
	        mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
	           
	        mailHelper.setFrom(from); mailHelper.setTo(to);
	        mailHelper.setSubject(subject); mailHelper.setText(content, true);
	           
	        mailSender.send(mail);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("msg", "비밀번호 변경 안내 메일을 보냈습니다.메일함을 확인해 주세요");
		model.addAttribute("url", "find_pw_form.action");
		return "alert.jsp";
		
	}
	
	
	//비밀번호 변경 안내 메일 클릭시
	@RequestMapping(value = "changepw.action", method = RequestMethod.GET)
	public String pwmail(@RequestParam("auth") String auth, Model model)
	{
		
		try
		{
			SignDAO dao = new SignDAO();
			
			int check = dao.checkUsePwAuth(auth);
			
			if (check!=1)	// 이미 사용한 키거나 잘못된 접근일 때
			{
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "comfit.action");
				return "alert.jsp";
			}	
			
			// 인증 키 사용
			dao.updatePwAuth(auth);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("auth",auth);
		return "/WEB-INF/view/user/main/user_find_pw_modifiy.jsp";
	}
	
	
	@RequestMapping(value = "/changepassword2.action" , method = RequestMethod.POST)
	public String changePassword(@RequestParam("auth") String auth, @RequestParam("password") String password, Model model)
	{
		//System.out.println(auth);
		//System.out.println(password);
		
		
		try
		{
			SignDAO dao = new SignDAO();
			
			int check =  dao.changePassword(auth, password);
			
			if (check!=1)	// 비밀번호 변경 실패시
			{
				model.addAttribute("msg", "서버 에러");
				model.addAttribute("url", "comfit.action");
				return "alert.jsp";
			}	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("msg", "비밀번호가 변경되었습니다!!!");
		model.addAttribute("url", "comfit.action");
		
		return "alert.jsp";
	}
	
	
	
	
	
	
	
}
