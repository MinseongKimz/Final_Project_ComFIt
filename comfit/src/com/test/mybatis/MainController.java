/*====================================
 	MainController.java
 	- 컨트롤러 객체
 	- 비로그인 헤더 관련 컨트롤러
 	- 메인 아이콘, 로그인, 회원가입, 고객센터 이동
 	- 김민성 작성
 ====================================*/



package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/comfit.action")
	public String hello(Model model)
	{
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		try
		{
			model.addAttribute("pdList", dao.non_user_pdList());
			model.addAttribute("cateList", dao.cateList());
			result = "/WEB-INF/view/user/main/non_user_main.jsp";
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/loginform.action", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request)
	{
		String lat = request.getParameter("lat"); 	// 위도
		String lon = request.getParameter("lon");	// 경도
		
		
		HttpSession session = request.getSession();
		session.setAttribute("lat", lat);
		session.setAttribute("lon", lon);
		
		return "/WEB-INF/view/user/main/user_login.jsp";
	}
	
	@RequestMapping("/registform.action")
	public String regist(Model model)
	{
		return "/WEB-INF/view/user/main/user_signup_info.jsp";
	}
	
	@RequestMapping("/svc.action")
	public String svc(Model model)
	{
		
		return "/WEB-INF/view/user/main/user_svcenter_main.jsp";
	}
	
	
}