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
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		String pd_id = request.getParameter("pd_id");
		
		String userId = null;
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");
		
		//체크
	
		int check_id = 0;
		try
		{
			if (pd_id.contains("dire"))
			{
				userId = dao.direuserId(pd_id);
				
				if (userId.equals(u_id))
					check_id = 1;
				
				
				session.setAttribute("check_id", check_id);
				model.addAttribute("suggestList", dao.suggestList(pd_id));
				model.addAttribute("drPdList", dao.drPdList(pd_id));
				//System.out.println(pd_id);
				model.addAttribute("pd_id", pd_id);
				model.addAttribute("userLevel", dao.userLevel(userId));
				model.addAttribute("sellCount", dao.sellCount(userId));
				result = "/WEB-INF/view/user/main/user_direct_sell.jsp";
			}
			else if(pd_id.contains("deli"))
			{
				
				userId = dao.deliuserId(pd_id);
				if (userId.equals(u_id))
					check_id = 1;
				
				session.setAttribute("check_id", check_id);
				
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
	
	
	
	// 구매제안 폼에서 장소선택하면
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
	
	
	
	
	
	
}
