package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController
{
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/user_mainlist.action", method = RequestMethod.GET)
	public String mainList(Model model)
	{
		String result = null;
		IProduct dao = sqlsession.getMapper(IProduct.class);
		model.addAttribute("pdList", dao.pdList());
		model.addAttribute("cateList", dao.cateList());
		
		result = "/WEB-INF/view/user_main.jsp";
		return result;
	}
	
	
}
