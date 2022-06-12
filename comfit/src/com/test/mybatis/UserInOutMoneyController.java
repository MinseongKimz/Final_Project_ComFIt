package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserInOutMoneyController
{
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/inputmoneyform.action", method = RequestMethod.GET)
	public String inputMoney(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_point_input.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/outputmoneyform.action", method = RequestMethod.GET)
	public String outputMoney(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_point_output.jsp";
		
		return result;
	}
	
	
	
	
	
	
}
