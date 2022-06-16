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
	public String returnSeach(Model model, String name, String maker, String realAvgPrice, String category)
	{
		
		
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		
		
		model.addAttribute("categorylist", dao.categoryList());
		model.addAttribute("makerlist", dao.makerList(category));
		
		model.addAttribute("name", name);					// 물품명
		model.addAttribute("mk", maker);					// 제조사
		model.addAttribute("realAvgPrice", realAvgPrice);	// 평균가격
		model.addAttribute("cate", category);				// 카테고리
		
		
		
		return "/WEB-INF/view/user/main/user_delivery_seller_edit.jsp";
		
	}
	
	
	@RequestMapping(value = "/changeMakerSelect.action", method = RequestMethod.GET)
	public String changeMaker(Model model, String optionValue)
	{
		
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		model.addAttribute("makerlist", dao.makerList2(optionValue));

		String result = "/WEB-INF/view/user/main/MakerChange.jsp";

		return result;
	}
	
	
	// 판매글 등록 페이지 select option 에 categoryList 연결
	@RequestMapping(value = "user_delivery_seller_edit.action", method = RequestMethod.GET)
	public String categoryOption(Model model)
	{
		String result = null;
		
		IAdmin dao = sqlSeesion.getMapper(IAdmin.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		
		result = "/WEB-INF/view/user/main/user_delivery_seller_edit.jsp";
		
		return result;
	}
	
	
	//판매글 등록글 insert
	@RequestMapping(value = "/deliveryinsert.action", method = RequestMethod.POST)
	public String deliveryinsert(deliveryInsertDTO dto)
	{
		String result = null;
		
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		dao.deliveryInsert(dto);
		
		result = "redirect:comfit.action";
		
		return result;
	}

	
	
	
}
