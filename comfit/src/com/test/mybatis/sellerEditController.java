package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class sellerEditController
{

	@Autowired
	private SqlSession sqlSession;
	
	    //배송거래 판매글 등록 페이지 접속과 select option 에 categoryList 연결
		@RequestMapping(value = "user_delivery_seller_edit.action", method = RequestMethod.GET)
		public String categoryOption(Model model)
		{
			String result = null;
			
			IAdmin dao = sqlSession.getMapper(IAdmin.class);
			
			model.addAttribute("categorylist", dao.categoryList());
			
			result = "/WEB-INF/view/user/main/user_delivery_seller_edit.jsp";
			
			return result;
		}
		
		
		//배송거래 판매글 등록글 insert
		@RequestMapping(value = "/deliveryinsert.action", method = RequestMethod.POST)
		public String deliveryinsert(deliveryInsertDTO dto)
		{
			String result = null;
			
			IProduct dao = sqlSession.getMapper(IProduct.class);
			
			dao.deliveryInsert(dto);
			
			result = "redirect:comfit.action";
			
			return result;
		}
		
		
		// 직거래 판매글 등록 페이지 접속과 select option 에 categoryList 연결
		@RequestMapping(value = "/user_direct_seller_edit.action", method = RequestMethod.GET)
		public String categoryChange(Model model)
		{
			String result = null;
			
			IAdmin dao = sqlSession.getMapper(IAdmin.class);
			
			model.addAttribute("categorylist", dao.categoryList());
			
			result = "/WEB-INF/view/user/main/user_direct_seller_edit.jsp";
			
			return result;
		}
		
		
		// 직거래 판매글 희망 거래 장소 검색
		@RequestMapping(value = "/geotest.action", method = RequestMethod.GET)
		public String geotest()
		{
			return "/comfit/WebContent/GeoTest.jsp";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}































