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
import org.springframework.web.bind.annotation.RequestParam;

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
      String result = null;
      
      IAdmin dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("useroutList", dao.adminUseroutList());
      
      result =  "/WEB-INF/view/admin/ad_userout_list.jsp";
      
      return result;
   }
   
   // 관리자 상품관리 리스트
   @RequestMapping(value = "/admin_product_list.action", method = RequestMethod.GET)
   public String adProductList(Model model)
   {
      String result = null;
      
      IAdmin dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("productlist", dao.adminProductList());
      
      result = "/WEB-INF/view/admin/ad_product_list.jsp";
      
      return result;
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
   
   // 관리자 FAQ 리스트 출력
   @RequestMapping(value = "/admin_faq_list.action", method = RequestMethod.GET)
   public String adFAQList(Model model)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   model.addAttribute("faqList", dao.faqList());
	   
	   result = "/WEB-INF/view/admin/ad_faq_list.jsp";
	   
	   return result;
	   
   }
   
   // 관리자 FAQ 글쓰기 페이지로 이동
   @RequestMapping(value = "/admin_faq_edit.action", method = RequestMethod.GET)
   public String adFAQinsertForm()
   {
	   return "/WEB-INF/view/admin/ad_faq_edit.jsp";
   }
   
   
   
   // 관리자 FAQ 글쓰기
   @RequestMapping(value = "/admin_faq_insert.action", method = RequestMethod.POST)
   public String adFAQInsert(FaqDTO faq)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   dao.faqInsert(faq);
	   
	   result = "redirect:admin_faq_list.action";
	   
	   return result;
   }
   
   // 관리자 FAQ 수정 폼으로 가기
   @RequestMapping(value = "/admin_faq_modify_form.action", method = RequestMethod.GET)
   public String adFAQModifyForm(Model model, String faq_id)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   
	   model.addAttribute("modify", dao.faqModifyForm(faq_id));
	   
	   result = "/WEB-INF/view/admin/ad_faq_modify.jsp";
	   
	   return result;
   }
   
   
   // 관리자 FAO 수정하기
   @RequestMapping(value = "/admin_faq_modify.action", method = RequestMethod.POST)
   public String adFAQModify(FaqDTO dto)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   dao.faqModify(dto);
	   
	   result = "redirect:admin_faq_list.action";
	   
	   return result;
   }
   
   /*
   admin_report_list.action 신고관리 
   admin_ask_list.action 문의관리
   admin_notice_list.action 공지사항
   admin_faq_list.action FAQ
   */
   
}