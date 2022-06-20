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
public class PdSelectController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/pd_detail.action", method = RequestMethod.GET)
	public String pdSelect(Model model, HttpServletRequest request)
	{
		// 반환할 URL
		String result = null;
		// 주입
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
		// 선택된 상품ID
		String pd_id = request.getParameter("pd_id");
		
		// 해당 상품의 판매자
		String userId = null;
		
		// 로그인해서 진입한 회원
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");
		
		
		// 구매자인지 판매자인지 체크값
		int check_id = 0;
		
		// 로그인해서 진입한 회원이 구매제안을 했다면 -- 특정값 반환, 구매자이면서 -> 구매제안했으면, 더이상 구매제안 불가
		int us_check = 0;
		
		// 선택한 상품에 구매제안 있는지?
		int sl_check = 0;
		
		try
		{
			if (pd_id.contains("dire"))
			{
				// SELECT (채택) 되었는지?
				int sel_Check = dao.selCheck(pd_id);
				int sel_Check2 = sel_Check;
				System.out.println(sel_Check2);
				// 제안코드따오기(채택된 상품을 보여주기 위함)
				String suggest_code = dao.sugCheck(pd_id);
				
				SuggestUserDTO su = new SuggestUserDTO();
				su.setPd_id(pd_id);
				su.setU_id(u_id);
				
				int end_day = dao.end_day(pd_id);
				
				// 판매자라면 1반환
				userId = dao.direuserId(pd_id);
				
				// 제안이 존재한다면 제안 갯수 반환 
				sl_check = dao.slCheck(pd_id);
				
				// 내 제안이 있다면 갯수 반환
				us_check = dao.usCheck(su);
				
				// 판매자라면 1반환
				if (userId.equals(u_id))
					check_id = 1;

				
				session.setAttribute("check_id", check_id);
				model.addAttribute("end_day", end_day);
				model.addAttribute("sel_Check2", sel_Check2);
				model.addAttribute("sl_check", sl_check);
				model.addAttribute("us_check", us_check);
				model.addAttribute("suggestList", dao.suggestList(pd_id));
				model.addAttribute("drPdList", dao.drPdList(pd_id));
				model.addAttribute("sel_Check", sel_Check);
				model.addAttribute("suggest_code", suggest_code);
				model.addAttribute("pd_id", pd_id);
				model.addAttribute("userLevel", dao.userLevel(userId));
				model.addAttribute("sellCount", dao.sellCount(userId));
				result = "/WEB-INF/view/user/main/user_direct_sell.jsp";
			}
			else if(pd_id.contains("deli"))
			{
				int end_date = dao.end_date(pd_id);
				// 판매자라면 1반환
				SuggestUserDTO dto = new SuggestUserDTO();
				dto.setPd_id(pd_id);
				dto.setU_id(u_id);
				
				// 나의 입찰이 있다면..
				int ub_Check = dao.ub_Check(dto);
				
				// 낙찰이 존재한다면
				int buy_count = dao.buy_count(pd_id);
				
				int final_price = 0;
				int now_price = 0;
				if (buy_count != 0)
					final_price = dao.final_price(pd_id);
				
				int blCheck = dao.blCheck(pd_id);
				
				// 입찰리스트 존재한다면
				if (blCheck != 0)
					now_price = dao.now_price(pd_id);
				
				int bs_check = dao.bsCheck(dto);
				
				
				
	
				
				System.out.println(buy_count);
				userId = dao.deliuserId(pd_id);
				
				
				if (userId.equals(u_id))
					check_id = 1;
				
				session.setAttribute("check_id", check_id);
				model.addAttribute("blCheck", blCheck);
				model.addAttribute("now_price", now_price);
				model.addAttribute("buy_count", buy_count);
				model.addAttribute("final_price", final_price);
				model.addAttribute("ub_Check", ub_Check);
				model.addAttribute("bs_check", bs_check);
				model.addAttribute("end_date", end_date);
				model.addAttribute("bidList", dao.bidList(pd_id));
				model.addAttribute("dlPdList", dao.dlPdList(pd_id));
				model.addAttribute("userLevel", dao.userLevel(userId));
				model.addAttribute("sellCount", dao.sellCount(userId));
				result = "/WEB-INF/view/user/main/user_delivery_seller.jsp";
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return result;
	}
	
	
	
	// 구매제안 폼에서 구매제안하면
	@RequestMapping(value = "/direct_place.action", method = RequestMethod.GET)
	public String selectPlace(Model model, String pd_id, HttpServletRequest request)
	{
		String result = "";
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		String hope_sdate = request.getParameter("hope_sdate");
		String hope_edate = request.getParameter("hope_edate");
		//System.out.println(hope_sdate);
		//System.out.println(hope_edate);
		String hope_stime = request.getParameter("hope_stime");
		String hope_etime = request.getParameter("hope_etime");
		
		try
		{
			int stime = Integer.parseInt(hope_stime.substring(0, 2));
			int etime = Integer.parseInt(hope_etime.substring(0, 2));
			//System.out.println(stime);
			model.addAttribute("mgrs", dao.mgrs(pd_id));
			model.addAttribute("hope_sdate", hope_sdate);
			model.addAttribute("hope_edate", hope_edate);
			model.addAttribute("pd_id", pd_id);
			System.out.println(pd_id);
			model.addAttribute("stime", stime);
			model.addAttribute("etime", etime);
			result = "WEB-INF/view/user/main/direct_place.jsp";	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 입찰폼 에서 입찰하면
	@RequestMapping(value = "/bid_place.action", method = RequestMethod.GET)
	public String bidPlace(Model model, String pd_id, HttpServletRequest request)
	{
		String result = "";
		try
		{
			model.addAttribute("pd_id", pd_id);
			System.out.println(pd_id);
			result = "WEB-INF/view/user/main/bid_place.jsp";	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	
	// 경매 에서 즉시구매하면
	@RequestMapping(value = "/buy_place.action", method = RequestMethod.GET)
	public String buyPlace(Model model, String pd_id, String imdPrice, HttpServletRequest request)
	{
		String result = "";
		try
		{
			
			model.addAttribute("pd_id", pd_id);
			model.addAttribute("imdPrice", imdPrice);
			System.out.println(pd_id);
			result = "WEB-INF/view/user/main/buyNow_place.jsp";	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	
	
}
