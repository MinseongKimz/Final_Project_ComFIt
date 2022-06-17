package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		
		   // 배송 판매 물품 등록버튼 누를때
		   @RequestMapping(value = "/deliveryinsert.action", method = RequestMethod.POST)
		   public String deliveryInsert(deliveryInsertDTO dto, HttpServletRequest request)
		   {
		      String result = null;
		      
		      IProduct dao = sqlSession.getMapper(IProduct.class);
		      
		      //System.out.println("■Controller■Controller■Controller");
		      
		      String pd_title = (String)request.getAttribute("pd_title");
		      String pd_name = (String)request.getAttribute("pd_name");
		      String pd_photo = (String)request.getAttribute("pd_photo");
		      String pd_as_remain = (String)request.getAttribute("pd_as_remain");
		      String pd_start_price = (String)request.getAttribute("pd_start_price");
		      String pd_maker_id = (String)request.getAttribute("pd_maker_id");
		      String pd_as_id = (String)request.getAttribute("pd_as_id");
		      String cf_price = (String)request.getAttribute("cf_price");
		      String comments = (String)request.getAttribute("comments");
		      String imd_price = (String)request.getAttribute("imd_price");
		      
		      HttpSession session = request.getSession();   
		      
		      dto.setPd_title(pd_title);
		      dto.setPd_name(pd_name);
		      dto.setPd_photo(pd_photo);
		      dto.setPd_as_remain(pd_as_remain);
		      dto.setPd_start_price(pd_start_price);
		      dto.setPd_maker_id(pd_maker_id);
		      dto.setPd_as_id(pd_as_id);
		      dto.setCf_price(cf_price);
		      dto.setComments(comments);
		      dto.setImd_price(imd_price);
		      
		      dto.setU_id((String)session.getAttribute("u_id"));
		      
		      dao.deliveryInsert(dto);
		      
		      
		      
		      
		      result = "redirect:redirect.action";	// PRG패턴이라나 뭐라나..
		      
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
		
		
		
		// 직거래 판매글 등록 insert
		@RequestMapping(value = "/directinsert.action", method = RequestMethod.POST)
		public String directInsert(directinsertDTO dto, HttpServletRequest request)
		{
			String result = null;
			
			IProduct dao = sqlSession.getMapper(IProduct.class);
			
			String pd_title = (String)request.getAttribute("pd_title");         
			String pd_hopeprice = (String)request.getAttribute("pd_hopeprice");         
			String pd_name = (String)request.getAttribute("pd_name");           
			String pd_as_remain = (String)request.getAttribute("pd_as_remain"); 
			String pd_hope_sdate = (String)request.getAttribute("pd_hope_sdate");  
			String pd_hope_edate = (String)request.getAttribute("pd_hope_edate");  
			String pd_hope_stime = (String)request.getAttribute("pd_hope_stime");  
			String pd_hope_etime = (String)request.getAttribute("pd_hope_etime");
			String pd_hope_place = (String)request.getAttribute("pd_hope_place");  
			String pd_maker_id = (String)request.getAttribute("pd_maker_id");  
			String pd_as_id = (String)request.getAttribute("pd_as_id");        
			String cf_price = (String)request.getAttribute("cf_price");         
			String comments = (String)request.getAttribute("comments");        
			String pd_hope_mgrs = (String)request.getAttribute("pd_hope_mgrs");  
			String pd_photo = (String)request.getAttribute("pd_photo");     
			
			HttpSession session = request.getSession();
			
			dto.setPd_title(pd_title);
			dto.setPd_name(pd_name);
			dto.setPd_as_remain(pd_as_remain);
			dto.setPd_hope_sdate(pd_hope_sdate);
			dto.setPd_hope_edate(pd_hope_edate);
			dto.setPd_hope_stime(pd_hope_stime);
			dto.setPd_hope_etime(pd_hope_etime);
			dto.setPd_hope_place(pd_hope_place);
			dto.setPd_maker_id(pd_maker_id);
			dto.setPd_as_id(pd_as_id);
			dto.setCf_price(cf_price);
			dto.setComments(comments);
			dto.setPd_hope_mgrs(pd_hope_mgrs);
			dto.setPd_photo(pd_photo);
			dto.setPd_hopeprice(pd_hopeprice);
			
			dto.setU_id((String)session.getAttribute("u_id"));
			
			dao.directInsert(dto);
			
			result = "redirect:redirect.action";	// PRG패턴
			
			return result;
		}
	
		
		//판매 등록 후 다시 메인 보내기;
		@RequestMapping("/redirect.action") // PRG패턴
		public String redirect()
		{
			return "NewFile.jsp";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}































