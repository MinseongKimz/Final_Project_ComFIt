package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchContoller
{
	@Autowired
	private SqlSession sqlSeesion;
	
	
	
	@RequestMapping(value = "/searchproduct.action", method = RequestMethod.GET)
	public String search_prodcut(Model model)
	{
		String result = null;
		
		
		result = "/WEB-INF/view/user/main/user_search_product.jsp";
		
		
		return result;
	}
	
	
	@RequestMapping(value = "/search.action", method = RequestMethod.POST)
	public String search(Model model, @RequestParam("name") String name)
	{
		String result= null;
		
		result = NaversearchAPI.search(name);
		
		model.addAttribute("pdname", name);
		model.addAttribute("result", result);
		
		return "/WEB-INF/view/user/main/user_search_product.jsp";
	}
	
	
	@RequestMapping(value = "/returnsell.action", method = RequestMethod.GET)      // 선택하면 거래 등록 게시물로
	public String returnSeach(Model model, String name, String maker, String cfPrice, String category)
	{
		
		
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		
		
		model.addAttribute("categorylist", dao.categoryList());
		model.addAttribute("makerlist", dao.makerList(category));
		
		model.addAttribute("name", name);
		model.addAttribute("maker", maker);
		//model.addAttribute("cfPrice", cfPrice);
		model.addAttribute("cate", category);
		
		
		
		return "/WEB-INF/view/user/main/user_delivery_seller_edit.jsp";
		
	}
	
	
	
	
	
}
