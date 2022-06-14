package com.test.mybatis;

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
	public String pdSelect(Model model, String pd_id)
	{
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
		try
		{
			if (pd_id.contains("dire"))
			{
				model.addAttribute("suggestList", dao.suggestList(pd_id));
				model.addAttribute("drPdList", dao.drPdList(pd_id));
				result = "/WEB-INF/view/user/main/user_direct_sell.jsp";
			}
			else if(pd_id.contains("deli"))
			{
				model.addAttribute("bidList", dao.bidList(pd_id));
				model.addAttribute("dlPdList", dao.dlPdList(pd_id));
				result = "/WEB-INF/view/user/main/user_delivery_seller.jsp";
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return result;
	}
}
