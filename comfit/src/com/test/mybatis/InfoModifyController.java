


package com.test.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoModifyController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/pawsswordmodifyform.action", method = RequestMethod.GET)
	public String passwordModify()
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_pw_modify.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/telmodifyform.action", method = RequestMethod.GET)
	public String telmodify()
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_tel_modify.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value = "/addressmodifyform.action", method = RequestMethod.GET)
	public String addressmodify()
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_address_modify.jsp";
		
		return result;
	}
	
}
