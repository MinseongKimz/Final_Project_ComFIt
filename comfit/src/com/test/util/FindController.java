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
	
	@RequestMapping("/find_pw_form.action")
	public String pwSearchForm()
	{
		return "/WEB-INF/view/user/main/user_find_pw.jsp";
	}
}
