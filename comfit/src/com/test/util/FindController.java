package com.test.util;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.userDTO;


@Controller
public class FindController
{
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
			
			System.out.println(dto.getU_email());
			System.out.println(dto.getU_name());
			System.out.println(dto.getU_tel());
			
			result = dao.findPassword(dto);
			
			if (result!=1) // 찾은 계정이 없다면..
			{
				model.addAttribute("msg", "정보가 올바르지 않습니다.");
				model.addAttribute("url", "find_pw_form.action");
				return "alert.jsp";
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
