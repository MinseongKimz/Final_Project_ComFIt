/*====================================
 	userController.java
 	- 컨트롤러 객체
 ====================================*/



package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class userController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/admin_userlist.action", method = RequestMethod.GET)
	public String adminUserList(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("userList", dao.adminUserList());
		
		result = "/WEB-INF/view/ad_userlist.jsp";
			
		return result;
	}
	
	
	
}
