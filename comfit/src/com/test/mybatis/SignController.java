package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignController
{

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/nicknamecheck.action", method = RequestMethod.POST)
	public String nickNameCheck(Model model, String nickName)
	{
		String result = null;
		
		IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class);
		
		int nickCheck = dao.nickCheck(nickName);
		System.out.println(nickCheck);
		model.addAttribute("nickCheck", nickCheck);
		
		result = "/WEB-INF/view/user/main/user_nickCheck_ok.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/emailcheck.action", method = RequestMethod.POST)
	public String checkEmail(Model model, String email)
	{
		String result = null;
		
		IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class);
		
		int emailCheck = dao.emailCheck(email);
		System.out.println(email + "/// " + emailCheck);
		model.addAttribute("nickCheck", emailCheck);  // 닉체크쓰던곳 걍 똫깥이 쓰겟음
		
		result = "/WEB-INF/view/user/main/user_nickCheck_ok.jsp";
		
		return result;
	}
	
} 