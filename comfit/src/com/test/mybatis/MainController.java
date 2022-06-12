/*====================================
 	MainController.java
 	- 컨트롤러 객체
 	- 비로그인 헤더 관련 컨트롤러
 	- 메인 아이콘, 로그인, 회원가입, 고객센터 이동
 	- 김민성 작성
 ====================================*/



package com.test.mybatis;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController
{
	
	@RequestMapping("/comfit.action")
	public String hello(Model model)
	{
		
		return "/WEB-INF/view/user/main/non_user_main.jsp";
	}
	
	
	@RequestMapping("/login.action")
	public String login(Model model)
	{
		return "/WEB-INF/view/user/main/user_login.jsp";
	}
	
	@RequestMapping("/regist.action")
	public String regist(Model model)
	{
		return "/WEB-INF/view/user/main/user_signup_info.jsp";
	}
	
	@RequestMapping("/svc.action")
	public String svc(Model model)
	{
		return "/WEB-INF/view/user/main/user_notice_list.jsp";
	}
	
	
}