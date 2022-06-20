package com.test.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.util.SuggestDAO;

@Controller
public class SuggestController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "suggest.action", method = RequestMethod.GET)
	public String suggest(Model model, HttpServletRequest request)
	{
		String result = "";
		SuggestListDTO dto = new SuggestListDTO();
		SuggestDAO dao = new SuggestDAO();
		int sug_count = 0;
		dto.setPrice(request.getParameter("suggest_price"));
		System.out.println(request.getParameter("suggest_price"));
		dto.setSuggest_date(request.getParameter("suggest_date"));
		dto.setSuggest_time(request.getParameter("suggest_time"));
		dto.setSuggest_place(request.getParameter("suggest_place"));
		dto.setPlace_detail(request.getParameter("place_detail"));
		dto.setU_id(request.getParameter("u_id"));
		dto.setPd_id(request.getParameter("pd_id"));
		String pd_id = request.getParameter("pd_id");
		
		try
		{
			sug_count = dao.add_suggest(dto);
			System.out.println(sug_count);
			if (sug_count != 1)
			{
				return null;
			}
			model.addAttribute("pd_id", pd_id);
			result = "redirect:pd_detail.action?pd_id="+pd_id;
			return result;
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
				
		return result;		
	}
	
	
	
	@RequestMapping(value = "select.action", method = RequestMethod.GET)
	public String select(Model model, HttpServletRequest request)
	{
		String result = "";
		String suggest_code = request.getParameter("suggest_code");
		//System.out.println(suggest_code);
		String pd_id = request.getParameter("pd_id");
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
		int selectCount = 0;
		try
		{
			selectCount = dao.selectSuggest(suggest_code);
			if (selectCount == 1)
			{
				result="redirect:pd_detail.action?pd_id="+pd_id;
				return result;
			}
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	
	}
	
	
	@RequestMapping(value = "bid.action", method = RequestMethod.GET)
	public String bid(Model model, HttpServletRequest request)
	{
		String result = "";
		BidListDTO dto = new BidListDTO();
		SuggestDAO dao = new SuggestDAO();
		int bid_count = 0;
		
		dto.setPrice(request.getParameter("suggest_price"));
		String price = request.getParameter("suggest_price");
		System.out.println(price);
		
		dto.setAddress(request.getParameter("address"));
		String address = request.getParameter("address");
		System.out.println(address);
		
		dto.setAddr_detail(request.getParameter("addr_detail"));
		String addr_detail = request.getParameter("addr_detail");
		System.out.println(addr_detail);
		
		dto.setU_id(request.getParameter("u_id"));
		String u_id = request.getParameter("u_id");
		System.out.println(u_id);
		
		dto.setPd_id(request.getParameter("pd_id"));
		
		
		
		String pd_id = request.getParameter("pd_id");
		System.out.println(pd_id);
		try
		{
			bid_count = dao.add_bid(dto);
			System.out.println(bid_count);
			if (bid_count != 1)
			{
				return null;
			}
			model.addAttribute("pd_id", pd_id);
			result = "redirect:pd_detail.action?pd_id=" + pd_id;
			return result;
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
				
		return result;		
	}
	
	@RequestMapping(value = "buy.action", method = RequestMethod.GET)
	public String buy(Model model, HttpServletRequest request)
	{
		String result = "";
		BidListDTO dto = new BidListDTO();
		SuggestDAO dao = new SuggestDAO();
		int bid_count = 0;
		
		dto.setPrice(request.getParameter("price"));
		String price = request.getParameter("price");
		System.out.println(price);
		
		dto.setAddress(request.getParameter("address"));
		String address = request.getParameter("address");
		System.out.println(address);
		
		dto.setAddr_detail(request.getParameter("addr_detail"));
		String addr_detail = request.getParameter("addr_detail");
		System.out.println(addr_detail);
		
		dto.setU_id(request.getParameter("u_id"));
		String u_id = request.getParameter("u_id");
		System.out.println(u_id);
		
		dto.setPd_id(request.getParameter("pd_id"));
		
		
		
		IProduct pdao = sqlSession.getMapper(IProduct.class); 
		
		String pd_id = request.getParameter("pd_id");
		System.out.println(pd_id);
		try
		{
			// 입찰프로시저 실행
			bid_count = dao.add_bid(dto);
			System.out.println(bid_count);
			
			
			if (bid_count != 1)
				return null;
			
			// 즉시구매 인서트 실행
			SuggestUserDTO sdto = new SuggestUserDTO();
			sdto.setPd_id(pd_id);
			sdto.setU_id(u_id);
			
			String bid_code = dao.getB_code(sdto);
			System.out.println(bid_code);
			int buy_count = pdao.add_buy(bid_code);
			
			if (buy_count !=1)
				return null;
			
			
			model.addAttribute("pd_id", pd_id);
			result = "redirect:pd_detail.action?pd_id=" + pd_id;
			return result;
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
				
		return result;		
	}
	
	
	
	
	
	
}
