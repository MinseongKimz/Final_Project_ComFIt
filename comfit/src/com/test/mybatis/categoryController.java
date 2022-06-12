/*===========================
 * categoryController.java
 ===========================*/


package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class categoryController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 카테고리 리스트
	@RequestMapping(value = "/ad_category_list.action", method = RequestMethod.GET)
	public String categoryList(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		
		result = "/WEB-INF/view/admin/ad_category_list.jsp";
		
		return result;
		
	}
	
	// 관리자 카테고리 insert
	@RequestMapping(value = "/categoryInsert.action", method = RequestMethod.GET)
	public String categoryInsert(String category_name)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		dao.categoryInsert(category_name);
		
		result = "redirect:ad_category_list.action";
		
		return result;
	}
	
	// 관리자 카테고리 delete
	@RequestMapping(value = "/categoryDelete.action", method = RequestMethod.GET)
	public String categoryDelete(int pd_category_id)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		dao.categoryDelete(pd_category_id);
		
		result = "redirect:ad_category_list.action";
		
		return result;
	}
	
	
	// 판매글 등록 페이지 select option 에 카테고리 연결하기
	@RequestMapping(value = "user_delivery_seller_edit.action", method = RequestMethod.GET)
	public String categoryOption(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
































