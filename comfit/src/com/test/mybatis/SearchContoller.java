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
public class SearchContoller
{
	@Autowired
	private SqlSession sqlSeesion;
	
	
	// 배송거래에서 - 물품검색 첫화면 접속
	@RequestMapping(value = "/searchproduct.action", method = RequestMethod.GET)
	public String search_prodcut(Model model)
	{
		String result = null;
		result = "/WEB-INF/view/user/main/user_search_product.jsp";
		return result;
	}
	
	// 배송거래 물품검색페이지에서 검색버튼 클릭시 
	@RequestMapping(value = "/search.action", method = RequestMethod.POST)
	public String search(Model model, @RequestParam("name") String name)
	{
		String result= null;
		
		result = NaversearchAPI.search(name);
		
		model.addAttribute("pdname", name);
		model.addAttribute("result", result);
		
		return "/WEB-INF/view/user/main/user_search_product.jsp";
	}
	
	
	// 배송거래 물품검색에서 물품을 확정 
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
	
	

	// 직거래에서 - 물품검색 첫화면 접속
	@RequestMapping(value = "/searchproduct2.action", method = RequestMethod.GET)
	public String search_prodcut2(Model model)
	{
		String result = null;
		
		result = "/WEB-INF/view/user/main/user_search_product2.jsp";
		
		return result;
	}

	
	// 직거래 물품검색페이지에서 검색버튼 클릭시 
	@RequestMapping(value = "/search2.action", method = RequestMethod.POST)
	public String search2(Model model, @RequestParam("name") String name)
	{
		String result= null;
		
		result = NaversearchAPI.search(name);
		
		model.addAttribute("pdname", name);
		model.addAttribute("result", result);
		
		return "/WEB-INF/view/user/main/user_search_product2.jsp";
	}
	
	
	// 직거래 물품검색에서 물품을 확정 
	@RequestMapping(value = "/returnsell2.action", method = RequestMethod.GET)      // 선택하면 거래 등록 게시물로
	public String returnSeach2(Model model, String name, String maker, String realAvgPrice, String category)
	{
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		model.addAttribute("makerlist", dao.makerList(category));
		
		model.addAttribute("name", name);					// 물품명
		model.addAttribute("mk", maker);					// 제조사
		model.addAttribute("realAvgPrice", realAvgPrice);	// 평균가격
		model.addAttribute("cate", category);				// 카테고리
		
		
		return "/WEB-INF/view/user/main/user_direct_seller_edit.jsp";
	}

	
	
	
}
