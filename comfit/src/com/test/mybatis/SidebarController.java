package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SidebarController
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 사용자의 요청 주소와 메소드를 매핑하는 과정 필요
	// 이 떄, 전송 방식은 submit 액션인 경우만 POST 로 설정하고
	// 나머지 모든 전송 방식은 GET 으로 처리한다.
	
	// 관리자 메인화면
	@RequestMapping(value = "/ad_main.action", method = RequestMethod.GET)
	public String main()
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_main.jsp";
		
		return result;
		
	}
	
	// 일반회원 관리
	@RequestMapping(value = "/admin_userlist.action ", method = RequestMethod.GET)
	public String admin_userlist(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());		
		
		result = "/WEB-INF/view/admin/ad_userlist.jsp";
		
		return result;		
	}
	
	// 차단회원 관리
	@RequestMapping(value = "/admin_bannedlist.action ", method = RequestMethod.GET)
	public String admin_bannedlist(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_bannedlist.jsp";
				return result;		
	}	
	
	// 탈퇴회원 관리
	@RequestMapping(value = "/admin_userout.action ", method = RequestMethod.GET)
	public String admin_userout(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_userout.jsp";
				return result;		
	}	
	
	// 상품관리 
	@RequestMapping(value = "/admin_product.action ", method = RequestMethod.GET)
	public String admin_product(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_product.jsp";

		return result;		
	}		
	
	// 입출금관리
	@RequestMapping(value = "/admin_money.action ", method = RequestMethod.GET)
	public String admin_money(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_money.jsp";

		return result;		
	}	
	
	// 카테고리 관리
	@RequestMapping(value = "/admin_category.action ", method = RequestMethod.GET)
	public String admin_category(Model model)
	{
		String result = null;

		IAdmin dao = sqlSession.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());			
		
		result = "/WEB-INF/view/admin/ad_category.jsp";

		return result;		
	}	
	
	// 신고관리
	@RequestMapping(value = "/admin_report.action ", method = RequestMethod.GET)
	public String admin_report(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_report.jsp";

		return result;		
	}	
	
	// 문의관리
	@RequestMapping(value = "/admin_ask.action ", method = RequestMethod.GET)
	public String admin_ask(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_ask.jsp";

		return result;		
	}	
	
	// 공지사항
	@RequestMapping(value = "/admin_notice.action ", method = RequestMethod.GET)
	public String admin_notice(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_notice.jsp";

		return result;		
	}	
	
	// FAQ
	@RequestMapping(value = "/admin_faq.action ", method = RequestMethod.GET)
	public String admin_faq(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/admin/ad_faq.jsp";

		return result;		
	}

}
