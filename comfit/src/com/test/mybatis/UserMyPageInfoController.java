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
public class UserMyPageInfoController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 마이페이지 호출액션
	@RequestMapping(value = "/user_mypage.action", method = RequestMethod.GET)
	public String userMypage(Model model, HttpServletRequest request)
	{
		String result = null;

		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			if (u_id==null)
			{
				return "logout.action";
			}
			
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			model.addAttribute("myInfo", mypage.myInfo(u_id));
			model.addAttribute("level", mypage.myLevel(u_id));
			model.addAttribute("point", mypage.myPoint(u_id));
			model.addAttribute("myMoneyList", mypage.myMoneyList(u_id));
			model.addAttribute("buyList", mypage.buyList(u_id));
			model.addAttribute("sellList", mypage.sellList(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			return "logout.action";
		}
		
		return result;
	}
	
	// 마이페이지 내정보 수정 액션
	@RequestMapping(value = "/user_information.action", method = RequestMethod.GET)
	public String userInformation(Model model, HttpServletRequest request)
	{
		String result = null;
		
		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			
			model.addAttribute("userInfo", mypage.myDetailInfo(u_id));
			model.addAttribute("level", mypage.myLevel(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage_info.jsp";
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	// 마이페이지 구매내역 액션
	@RequestMapping(value = "/user_buylist.action", method = RequestMethod.GET)
	public String userBuylist(Model model, HttpServletRequest request)
	{
		String result = null;
		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			
			model.addAttribute("buyList", mypage.buyList(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage_buylist.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	

	// 마이페이지 판매내역 액션
	@RequestMapping(value = "/user_selllist.action", method = RequestMethod.GET)
	public String userSelllist(Model model, HttpServletRequest request)
	{
		String result = null;
		
		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			
			model.addAttribute("sellList", mypage.sellList(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage_sell_list.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 마이페이지 입출금내역 액션
	@RequestMapping(value = "/user_moneylist.action", method = RequestMethod.GET)
	public String userMoneylist(Model model, HttpServletRequest request)
	{
		String result = null;
		
		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			
			model.addAttribute("myMoneyList", mypage.myMoneyList(u_id));
			model.addAttribute("point", mypage.myPoint(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage_pointlist.jsp";
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 마이페이지 회원탈퇴 액션
	@RequestMapping(value = "/user_drop.action", method = RequestMethod.GET)
	public String userDrop(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_drop.jsp";
		
		return result;
	}
	

	// 마이페이지 찜한상품 액션
	@RequestMapping(value = "/user_wish.action", method = RequestMethod.GET)
	public String userWish(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_wish_list.jsp";
		
		return result;
	}
	

	// 마이페이지 입금 폼 액션
	@RequestMapping(value = "/inputmoneyform.action", method = RequestMethod.GET)
	public String inputMoney(Model model, HttpServletRequest request)
	{
		String result = null;
		
		try
		{
			HttpSession session = request.getSession();
			String u_id = (String)session.getAttribute("u_id");
			
			IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
			model.addAttribute("point", mypage.myPoint(u_id));
			model.addAttribute("u_name", mypage.nameSearch(u_id));
			
			result = "/WEB-INF/view/user/mypage/user_mypage_point_input.jsp";
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 마이페이지 입금 실제 insert 액션
	@RequestMapping(value = "/insertmoney.action", method = RequestMethod.POST)
	public String insertMoney(insertMoneyDTO dto, HttpServletRequest request)
	{
		String result = null;
		
		IUserMyPage dao = sqlSession.getMapper(IUserMyPage.class);
		
		dao.insertMoney(dto);
		
		result = "redirect:user_mypage.action";
		
		return result;
	}
	

	
	// 마이페이지 출금페이지로 이동 & 은행리스트 폼 액션
	@RequestMapping(value = "/outputmoneyform.action", method = RequestMethod.GET)
	public String outputMoney(Model model, HttpServletRequest request)
	{
		String result = null;
		
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");
		
		IUserMyPage mypage = sqlSession.getMapper(IUserMyPage.class);
		
		model.addAttribute("bankList", mypage.bankList());
		model.addAttribute("point", mypage.myPoint(u_id));
		model.addAttribute("u_id", u_id);
		
		result = "/WEB-INF/view/user/mypage/user_mypage_point_output.jsp";
		
		return result;
	}
	
	

	
	// 마이페이지 출금 액션 처리
	@RequestMapping(value = "/outMoney.action", method = RequestMethod.POST)
	public String outMoney(Model model, OutMoneyDTO dto)
	{
		String result = null;
		
		IUserMyPage dao = sqlSession.getMapper(IUserMyPage.class);
		
		dao.outMoney(dto);
		
		result = "redirect:user_mypage.action";
		
		return result;
				
				
	}
	
	
	
	

	//마이페이지 프로필 사진 변경 액션
	@RequestMapping(value = "/changeprofileform.action", method = RequestMethod.GET)
	public String changeProfileForm(Model model, @RequestParam("u_id") String u_id)
	{
		String result = null;		
		
		System.out.println(u_id);
		
		result = "/WEB-INF/view/user/mypage/user_mypage_changProfile.jsp";
		
		
		return result;
	}
	
	// 마이페이지 프로필 변경 
	@RequestMapping(value = "/changeprofile.action", method = RequestMethod.POST)
	public String changeProfile(HttpServletRequest request, userDTO dto, Model model)
	{
		try
		{
			String u_id = (String)request.getAttribute("u_id");
			String u_profile = (String)request.getAttribute("u_profile");
			
			dto.setU_id(u_id);
			dto.setU_profile(u_profile);
			
			IUserMyPage dao = sqlSession.getMapper(IUserMyPage.class);
			
			int result = dao.changeProfile(dto);
			
			if(result!=1)
			{
				model.addAttribute("msg", "DB 오류 발생");
				model.addAttribute("url", "user_mypage.action");
				return "alert.jsp";
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		model.addAttribute("msg", "프로필 변경 성공!!");
		model.addAttribute("url", "user_mypage.action");
		return "alert.jsp";
		
	}

	
}
