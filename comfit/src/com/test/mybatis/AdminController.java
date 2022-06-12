/*====================================
 	Sample.java
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
public class AdminController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인
	@RequestMapping(value = "/ad_login.action", method = RequestMethod.GET)
	public String adLogin(Model model)
	{
		return "/WEB-INF/view/admin/ad_login.jsp";
	}
	
	// 관리자 메인
	@RequestMapping(value = "/ad_main.action", method = RequestMethod.GET)
	public String adMain(Model model)
	{
		return "/WEB-INF/view/admin/ad_main.jsp";
	}
	
	// 관리자 유저리스트
	@RequestMapping(value = "/admin_userlist.action", method = RequestMethod.GET)
	public String adUserList(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("userList", dao.adminUserList());
		
		result = "/WEB-INF/view/admin/ad_userlist.jsp";
			
		return result;
	}
	
	// 관리자 차단회원 관리
	@RequestMapping(value = "/admin_bannedlist.action", method = RequestMethod.GET)
	public String adBannedList(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("userList", dao.adminBannedList());
		
		result = "/WEB-INF/view/admin/ad_userbanned_list.jsp";
			
		return result;
	}
	
	// 관리자 탈퇴회원 관리
	@RequestMapping(value = "/admin_userout_list.action", method = RequestMethod.GET)
	public String adUserout(Model model)
	{
		return "/WEB-INF/view/admin/ad_userout_list.jsp";
	}
	
	// 관리자 상품관리
	@RequestMapping(value = "/admin_product_list.action", method = RequestMethod.GET)
	public String adProductList(Model model)
	{
		return "/WEB-INF/view/admin/ad_product_list.jsp";
	}
	
	// 관리자 입출금관리
	@RequestMapping(value = "/admin_money_list.action", method = RequestMethod.GET)
	public String adMoneyList(Model model)
	{
		return "/WEB-INF/view/admin/ad_money_list.jsp";
	}
	
	// 카테고리 리스트
	@RequestMapping(value = "/admin_category_list.action", method = RequestMethod.GET)
	public String categoryList(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		
		result = "/WEB-INF/view/admin/ad_category_list.jsp";
		
		return result;
	}
	
	// 관리자 카테고리 관리
	@RequestMapping(value = "/admin_report_list.action", method = RequestMethod.GET)
	public String adReportList(Model model)
	{
		return "/WEB-INF/view/admin/ad_report_list.jsp";
	}
	
	// 관리자 신고 관리
	@RequestMapping(value = "/admin_ask_list.action", method = RequestMethod.GET)
	public String adAskList(Model model)
	{
		return "/WEB-INF/view/admin/ad_ask_list.jsp";
	}
	
	// 관리자 공지사항 관리
	@RequestMapping(value = "/admin_notice_list.action", method = RequestMethod.GET)
	public String adNoticeList(Model model)
	{
		return "/WEB-INF/view/admin/ad_notice_list.jsp";
	}
	
	// 관리자 FAQ 관리
	@RequestMapping(value = "/admin_faq_list.action", method = RequestMethod.GET)
	public String adFAQList(Model model)
	{
		return "/WEB-INF/view/admin/ad_faq_list.jsp";
	}
	
	// 상품 리스트
	@RequestMapping(value = "/ad_product_list_direct.action", method = RequestMethod.GET)
	public String adProductListDirect(Model model)
	{
		return "/WEB-INF/view/admin/ad_product_list_direct.jsp";
	}
	
}
