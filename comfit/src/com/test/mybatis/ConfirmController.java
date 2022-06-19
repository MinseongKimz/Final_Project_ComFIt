package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.util.ConfirmDAO;
import com.test.util.ConfirmDeliveryDTO;
import com.test.util.ConfirmDirectDTO;
import com.test.util.IConfirmDAO;

@Controller
public class ConfirmController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 직거래 판매확정 액션
	@RequestMapping(value = "/completedirectsell.action", method = RequestMethod.POST)
	public String completeDirectSell(ConfirmDirectDTO dto ,Model model)
	{
		String result = null;
		
		ConfirmDAO dao = new ConfirmDAO();
		
		int count = 0;
		
		try
		{
			count = dao.confirmDirectSell(dto);
			
			if (count == 0)
			{
				System.out.println("입력실패");
			}
			
			result = "redirect:user_selllist.action";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	// 직거래 구매확정 액션
	@RequestMapping(value = "/completedirectbuy.action", method = RequestMethod.POST)
	public String completeDirect(ConfirmDirectDTO dto ,Model model)
	{
		String result = null;
		
		ConfirmDAO dao = new ConfirmDAO();
		
		int count = 0;
		
		try
		{
			count = dao.confirmDirectBuy(dto);
			
			if (count == 0)
			{
				System.out.println("입력실패");
			}
			
			result = "redirect:user_buylist.action";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}

	// 택배거래 구매확정 액션
	@RequestMapping(value = "/completedeliverybuy.action", method = RequestMethod.POST)
	public String completeDelivery(ConfirmDeliveryDTO dto ,Model model)
	{
		String result = null;
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		try
		{
			dao.confirmDeliveryBuy(dto);
			
			result = "redirect:user_buylist.action";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	// 택배거래 판매확정 액션
	@RequestMapping(value = "/completedeliverysell.action", method = RequestMethod.POST)
	public String completeDeliverySell(ConfirmDeliveryDTO dto ,Model model)
	{
		String result = null;
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		try
		{
			dao.confirmDeliverySell(dto);
			
			result = "redirect:user_selllist.action";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
}
