/*====================================
    Sample.java
    - 컨트롤러 객체
 ====================================*/



package com.test.mybatis;


import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value = "/ad_loginform.action")
	public String adLogin(AdminLoginDTO dto, HttpServletRequest request) 
	{
		return "/WEB-INF/view/admin/ad_loginform.jsp";
	}

	// 관리자 로그인 확인
    @RequestMapping(value = "/ad_login.action", method = RequestMethod.POST)
    public String adminLogin(AdminLoginDTO dto, HttpServletRequest request, Model model) 
    {  
    	IAdmin dao = sqlSession.getMapper(IAdmin.class); 
    	AdminLoginDTO admin = new AdminLoginDTO();
    	String result = null;
    	
    	try
		{	
    		
			//dto.setAd_id(ad_id);
    		//dto.setAd_pw(ad_pw);
    		admin = dao.adminLogin(dto);
    		
    		if (admin.getCount().equals("1"))
			{
    			result = "ad_main.action";
			}
    		else {
    			result = "ad_loginform.action";
			}

			return result;
    		
		} catch (Exception e)
		{
			System.out.println(e.toString());
			return "redirect:ad_loginform.action";
		} 
    } 


   // 관리자 메인
   @RequestMapping(value = "/ad_main.action", method = RequestMethod.POST)
   public String adMain(Model model)
   {
      return "/WEB-INF/view/admin/ad_main.jsp";
   }
   
   // 관리자 유저리스트
   @RequestMapping(value = "/admin_userlist.action", method = RequestMethod.GET)
   public String adUserList(Model model, HttpServletRequest request)
   {
      String result = null;
      
      IAdmin dao = sqlSession.getMapper(IAdmin.class);
      

      model.addAttribute("userList", dao.adminUserList(request));

      // searchvalue 값이 없으면 전체 리스트 출력, 있으면... 그부분만 출력하게 만들고 싶음
      
      result = "/WEB-INF/view/admin/ad_userlist.jsp";
         
      return result;
   }
   

   // 관리자 유저검색
   @RequestMapping(value = "/admin_usersearchlist.action", method = RequestMethod.GET)
   public String adSearchUserList(Model model, String searchvalue)
   {
      String result = null;


      IAdmin dao = sqlSession.getMapper(IAdmin.class);

     // model.addAttribute("usersearchList", dao.adminSearchUserList(searchvalue));
      //model.addAttribute("productlistdelivery1", dao.adminProductDeliveryList_1(pd_num));

      result = "/WEB-INF/view/admin/ad_userlist_search.jsp";

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
   
   // 관리자 상품관리 검색 리스트
   @RequestMapping(value = "/admin_product_searchlist.action", method = RequestMethod.GET)
   public String adProductSearchList(Model model, String searchvalue)
   {
      String result = null;
      
      IAdmin dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("productlist", dao.adminProductSearchList(searchvalue));
      
      result = "/WEB-INF/view/admin/ad_product_searchlist.jsp";
      
      return result;
   }   
   
   // 관리자 상품관리 상세리스트1
   @RequestMapping(value = "/admin_product_list_delivery.action", method = RequestMethod.GET)
   public String adProductListDelivery(Model model, String pd_num)
   {
      String result = null;
      
      IAdmin dao = null;
      
      dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("productlistdelivery1", dao.adminProductDeliveryList_1(pd_num));
      model.addAttribute("productlistdelivery2", dao.adminProductDeliveryList_2(pd_num));
      model.addAttribute("productlistdelivery3", dao.adminProductDeliveryList_3(pd_num));
      model.addAttribute("productlistdelivery4", dao.adminProductDeliveryList_4(pd_num));
      model.addAttribute("productlistdelivery5", dao.adminProductDeliveryList_5(pd_num));
      
      result = "/WEB-INF/view/admin/ad_product_list_delivery.jsp";
      
      return result;
   }   
   
   // 관리자 상품관리 상세리스트2
   @RequestMapping(value = "/admin_product_list_direct.action", method = RequestMethod.GET)
   public String adProductListDirect(Model model, String pd_num)
   {
      String result = null;
      
      IAdmin dao = null;
      
      dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("productlistdirect1", dao.adminProductDirectList_1(pd_num));
      model.addAttribute("productlistdirect2", dao.adminProductDirectList_2(pd_num));
      model.addAttribute("productlistdirect3", dao.adminProductDirectList_3(pd_num));
      model.addAttribute("productlistdirect4", dao.adminProductDirectList_4(pd_num));
      model.addAttribute("productlistdirect5", dao.adminProductDirectList_5(pd_num));
      
      result = "/WEB-INF/view/admin/ad_product_list_direct.jsp";
      
      return result;
   }      
  
   // 관리자 입출금관리
   @RequestMapping(value = "/admin_money_list.action", method = RequestMethod.GET)
   public String adMoneyList(Model model)
   {
	  String result = null;
	  
	  IAdmin dao = sqlSession.getMapper(IAdmin.class);
	  
	  model.addAttribute("moneylist", dao.adminMoneyList());
	  
      result =  "/WEB-INF/view/admin/ad_money_list.jsp";
      
      return result;
   }
   
   // 관리자 입출금관리 검색
   @RequestMapping(value = "/admin_money_searchlist.action", method = RequestMethod.GET)
   public String adMoneySearchList(Model model, String searchvalue)
   {
	  String result = null;
	  
	  IAdmin dao = sqlSession.getMapper(IAdmin.class);
	  
	  model.addAttribute("moneylist", dao.adminMoneySearchList(searchvalue));
	  
      result =  "/WEB-INF/view/admin/ad_money_list.jsp";
      
      return result;
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
   
   // 관리자 신고 관리
   @RequestMapping(value = "/admin_report_list.action", method = RequestMethod.GET)
   public String adReportList(Model model)
   {
	      String result = null;
	      
	      IAdmin dao = sqlSession.getMapper(IAdmin.class);
	      
	      model.addAttribute("userReportlist", dao.adminReportList());
	      
	      result = "/WEB-INF/view/admin/ad_report_list.jsp";
	         
	      return result;      	   
	   
   }   
   
   // 관리자 문의
   @RequestMapping(value = "/admin_ask_list.action", method = RequestMethod.GET)
   public String adAskList(Model model)
   {
      String result = null;
      
      IAdmin dao = sqlSession.getMapper(IAdmin.class);
      
      model.addAttribute("adminAskList", dao.adminAskList());	   
      
      result =  "/WEB-INF/view/admin/ad_ask_list.jsp";
      
      return result;
   }
   

   @RequestMapping(value = "/ad_ask_list_reply.action", method = RequestMethod.GET)
   public String adAskListReply(Model model)
   {
	   String result = null;
	      
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	      
	   model.addAttribute("adminAskreplyList", dao.adAskListReply());		   
	   
	   result = "/WEB-INF/view/admin/ad_ask_list_reply.jsp";
	   
	   return result;
   }
      

   // 관리자 공지사항 출력
   @RequestMapping(value = "/admin_notice_list.action", method = RequestMethod.GET)
   public String adNoticeList(Model model)
   {
	   
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   model.addAttribute("noticeList", dao.usernoticeList());
	   
	   result = "/WEB-INF/view/admin/ad_notice_list.jsp";
	   
	   return result;
	   
   }
   //관리자 공지사항 입력폼 이동
   @RequestMapping(value="/admin_notice_edit.action",method=RequestMethod.GET)
   public String adNoticeinsertForm(Model model)
   {
	   
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   model.addAttribute("noticecateList", dao.noticecateList());
	   
	   return "/WEB-INF/view/admin/ad_notice_write.jsp";
   }
   
 
   // 관리자 공지사항 입력 
   @RequestMapping(value = "/noticeinsert.action", method = RequestMethod.POST)
   public String adNoticeinsert(NoticeDTO dto, @RequestParam("announce_cate_id") String announce_cate_id)
   {
	   String result = null;
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   dto.setAnoun_cate_id(announce_cate_id);
	   
	   dao.noticeInsert(dto);
	   
	   //System.out.println(announce_cate_id);
	   result = "redirect:admin_notice_list.action";
	   
	   return result;
   }

 
   // 관리자 공지사항 수정 폼으로 가기
   @RequestMapping(value = "/admin_notice_modify_form.action" ,method = RequestMethod.GET)
   public String adNoticeModifyForm(Model model, String announce_id)
   {
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   model.addAttribute("noticeModifyForm",dao.noticeModifyForm(announce_id));
	   
	   model.addAttribute("noticecateList", dao.noticecateList());
	   
	   
	   return "/WEB-INF/view/admin/ad_notice_modify.jsp";
   }
   
   // 관리자 공지사항 수정하기
   @RequestMapping(value = "/admin_notice_modify.action" ,method = RequestMethod.POST)
   public String adNoModify(NoticeDTO dto, @RequestParam("announce_cate_id") String announce_cate_id)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   dto.setAnoun_cate_id(announce_cate_id);
	   

	   dao.noticeModify(dto);

	   //dao.noticeInsert(notice);
	   

	   
	   result = "redirect:admin_notice_list.action";
	   
	   return result;
	   
   }

   
   
   
   
   
   
   // 관리자 공지사항 삭제하기
   @RequestMapping(value = "/admin_motice_delete.action" ,method = RequestMethod.GET)
   public String adNoticeDelete(String announce_id)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   dao.noticeDelete(announce_id);
	   
	   //System.out.println(dao.announce_id());
	   
	   result = "redirect:admin_notice_list.action";
	   
	   
	   return result;
   }
   
   
   
   // 관리자 FAQ 관리

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
   
   
   // 관리자 FAQ 삭제하기
   @RequestMapping(value = "/admin_faq_delete.action", method = RequestMethod.GET)
   public String adFAQDelete(String faq_id)
   {
	   String result = null;
	   
	   IAdmin dao = sqlSession.getMapper(IAdmin.class);
	   
	   //System.out.println(dto.getFaq_id());
	   
	   dao.faqDelete(faq_id);
	   
	   result = "redirect:admin_faq_list.action";
	   
	   return result;
   }
   
   
   
   
   /*
   admin_report_list.action 신고관리 
   admin_ask_list.action 문의관리
   
   admin_faq_list.action FAQ
   */
   
}