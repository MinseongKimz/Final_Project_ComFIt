/*===========================
 * categoryController.java
 ===========================*/


package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class categoryController
{
	@Autowired
	private SqlSession sqlSession;

	// 관리자 카테고리 insert
	@RequestMapping(value = "/categoryinsert.action", method = RequestMethod.GET)
	public String categoryInsert(String category_name)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		dao.categoryInsert(category_name);
		
		result = "redirect:admin_category_list.action";
		
		return result;
	}
	
	// 관리자 카테고리 delete
	@RequestMapping(value = "/categorydelete.action", method = RequestMethod.GET)
	public String categoryDelete(int pd_category_id)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		dao.categoryDelete(pd_category_id);
		
		result = "redirect:admin_category_list.action";
		
		return result;
	}
	
	
	
	
	
}


