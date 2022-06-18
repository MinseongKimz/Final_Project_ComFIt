package com.test.mybatis;

import java.util.ArrayList;

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
public class ProductController
{
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value = "/direct_sell.action", method = RequestMethod.GET)
	public String directsell(Model model)
	{
		String result = null;

		result = "/WEB-INF/view/user/main/user_direct_sell.jsp";

		return result;

	}



	@RequestMapping(value = "/user_mainlist.action", method = RequestMethod.POST)
	public String mainList(Model model, ProductDTO dto, HttpServletRequest request )

	{
		String result = null;
		
		IProduct dao = sqlsession.getMapper(IProduct.class);
		
		HttpSession session = request.getSession();
				
		String lat = (String)session.getAttribute("lat");
		String lon = (String)session.getAttribute("lon");
		
		dto.setLat(lat);
		dto.setLon(lon);
		
		model.addAttribute("deli_pdList", dao.deli_user_pdList());
		model.addAttribute("pdList", dao.user_pdList(dto));
		model.addAttribute("cateList", dao.cateList());

		result = "/WEB-INF/view/user/main/user_main.jsp";
		return result;
	}
	// 공지사항 출력하기
	@RequestMapping(value = "/user_notice_list.action", method = RequestMethod.GET)
	public String svcNotice(Model model)
	{
		String result = null;

		IAdmin dao = sqlsession.getMapper(IAdmin.class);

		model.addAttribute("usernoticeList", dao.usernoticeList());

		result = "/WEB-INF/view/user/main/user_notice_list.jsp";

		return result;
	}
	
	// 공지사항 출력 [ 고객센터 ]
	@RequestMapping(value = "/user_svc.action", method = RequestMethod.GET)
	public String svcCenter(Model model)
	{
		String result = null;

		IAdmin dao = sqlsession.getMapper(IAdmin.class);

		model.addAttribute("usernoticeList", dao.usernoticeList());

		result = "/WEB-INF/view/user/main/user_svcenter_main.jsp";

		return result;
	}

	

	// FAQ 출력  [ 고객센터 ]
	@RequestMapping(value = "/user_faq_list.action", method = RequestMethod.GET)
	public String svcFaq(Model model)
	{
		String result = null;

		IAdmin dao = sqlsession.getMapper(IAdmin.class);

		model.addAttribute("userfaqList", dao.userfaqList());

		result = "/WEB-INF/view/user/main/user_faq_list.jsp";

		return result;

	}
	// 내 문의 내역 클릭 -> 내 문의 내역 출력 [1]
	@RequestMapping(value = "/user_ask_list.action", method = RequestMethod.GET)
	public String svcAsk(Model model)
	{
		String result = null;

		IAdmin dao = sqlsession.getMapper(IAdmin.class);

		model.addAttribute("asklist", dao.asklist());
		
		result = "/WEB-INF/view/user/main/user_ask_list.jsp";

		
		
		return result;

	}
	
	// 내 문의내역 버튼 -> 상세 내역 출력   [2]                                      
	@RequestMapping(value = "/user_ask_my_list.action", method = RequestMethod.GET)
	public String Askcate(Model model,String ask_id)
	{
		String result = null;

		IAdmin dao = sqlsession.getMapper(IAdmin.class);

		model.addAttribute("asklist", dao.asklist());
		
		model.addAttribute("askModifyForm",dao.askModifyForm(ask_id));
		
		result = "/WEB-INF/view/user/main/user_ask.jsp";

		return result;

	}
	
	
	//문의 수정폼 이동  --------
	@RequestMapping(value="/user_ask_modify_form.action",method = RequestMethod.GET)
	public String AskModifyForm(Model model,String ask_id)
   {
	   String result = null;
		
	   IAdmin dao = sqlsession.getMapper(IAdmin.class);

	   model.addAttribute("asklist", dao.asklist());
		
	   model.addAttribute("askModifyForm",dao.askModifyForm(ask_id));
	   
	  
	   
	   result = "/WEB-INF/view/user/main/user_ask_update.jsp";
	   
	   return result;
   }

	
	
	
	//----------------------------------------------------------------------------------------
	//문의 수정 하기
	@RequestMapping(value="/user_ask_modify.action",method = RequestMethod.POST)
	public String AskModify(AskDTO dto , @RequestParam("ask_id") String ask_id)
   {
	   
	   String result = null;
		
	   IAdmin dao = sqlsession.getMapper(IAdmin.class);
	   
	   //System.out.println(ask_id);
	  
	   
	   
	   dto.setAsk_id(ask_id);
	  
	   dao.AskModify(dto);
	   System.out.println(ask_id);
	   
	   
	   result = "redirect:user_ask_my_list.action";
	   
	   return result;
	   
   }
	



}
