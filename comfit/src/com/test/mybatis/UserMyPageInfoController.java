package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMyPageInfoController
{
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/user_mypage.action", method = RequestMethod.GET)
	public String userMypage(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage.jsp";
		
		return result;
	}
	
	
	
	
	@RequestMapping(value = "/user_information.action", method = RequestMethod.GET)
	public String userInformation(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_info.jsp";
		
		return result;
	}
	
	// 구매내역
	@RequestMapping(value = "/user_buylist.action", method = RequestMethod.GET)
	public String userBuylist(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_buylist.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/user_selllist.action", method = RequestMethod.GET)
	public String userSelllist(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_sell_list.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/user_moneylist.action", method = RequestMethod.GET)
	public String userMoneylist(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_pointlist.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/user_drop.action", method = RequestMethod.GET)
	public String userDrop(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/mypage/user_mypage_drop.jsp";
		
		return result;
	}
	
	
	
	
}
