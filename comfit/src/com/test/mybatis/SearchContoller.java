package com.test.mybatis;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchContoller
{
	
	
	@RequestMapping(value = "/search.action", method = RequestMethod.POST)
	public String search(Model model, @RequestParam("name") String name)
	{
		String result= null;
		
		result = NaversearchAPI.search(name);
		
		
		model.addAttribute("pdname", name);
		model.addAttribute("result", result);
		
		return "user_search_product.jsp";
	}
	
	@RequestMapping(value = "/retunsell.action", method = RequestMethod.POST)
	public String returnSeach(Model model, @RequestParam("name") String name
			                             , @RequestParam("category") String category
			                             , @RequestParam("maker") String maker
			                             , @RequestParam("cfPrice") String cfPrice)
	{
		
		System.out.println(name);
		System.out.println(category);
		System.out.println(maker);
		System.out.println(cfPrice);
		
		
		return "s";
	}
	
	
	
}
