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
public class ProductController
{
	@Autowired
	private SqlSession sqlsession;
	
	
	
	@RequestMapping(value="/direct_sell.action", method = RequestMethod.GET)
	public String directsell(Model model)
	{
		String result = null;
		
		result= "/WEB-INF/view/user/main/user_direct_sell.jsp";
		
		return result;
		
	}
	
	@RequestMapping(value = "/user_mainlist.action", method = RequestMethod.GET)
	public String mainList(Model model, ProductDTO dto, HttpServletRequest request )
	{
		String result = null;
		
		IProduct dao = sqlsession.getMapper(IProduct.class);
		
		HttpSession session = request.getSession();
				
		String lat = (String)session.getAttribute("lat");
		String lon = (String)session.getAttribute("lon");
		
		dto.setLat(lat);
		dto.setLon(lon);
		
		
		model.addAttribute("pdList", dao.pdList(dto));
		model.addAttribute("cateList", dao.cateList());
		
		result = "/WEB-INF/view/user/main/user_main.jsp";
		return result;
	}
	

	@RequestMapping(value = "/user_svc.action", method = RequestMethod.GET) 
	public String svcCenter(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/main/user_svcenter_main.jsp";
		
		return result;
	}

	
	
	// 판매글 등록 페이지 select option 에 categoryList 연결
	@RequestMapping(value = "user_delivery_seller_edit.action", method = RequestMethod.GET)
	public String categoryOption(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlsession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		
		result = "/WEB-INF/view/user/main/user_delivery_seller_edit.jsp";
		
		return result;
	}
	   



}
