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
	
	
	// 배송 판매 물품 등록버튼 누를때
	@RequestMapping(value = "/deliveryinsert.action", method = RequestMethod.POST)
	public String deliveryInsert(deliveryInsertDTO dto, HttpServletRequest request)
	{
		String result = null;
		
		IProduct dao = sqlSeesion.getMapper(IProduct.class);
		
		//System.out.println("■Controller■Controller■Controller");
		
		String pd_title = (String)request.getAttribute("pd_title");
		String pd_name = (String)request.getAttribute("pd_name");
		String pd_photo = (String)request.getAttribute("pd_photo");
		String pd_as_remain = (String)request.getAttribute("pd_as_remain");
		String pd_start_price = (String)request.getAttribute("pd_start_price");
		String pd_maker_id = (String)request.getAttribute("pd_maker_id");
		String pd_as_id = (String)request.getAttribute("pd_as_id");
		String cf_price = (String)request.getAttribute("cf_price");
		String comments = (String)request.getAttribute("comments");
		String imd_price = (String)request.getAttribute("imd_price");
		
		HttpSession session = request.getSession();	
		
		dto.setPd_title(pd_title);
		dto.setPd_name(pd_name);
		dto.setPd_photo(pd_photo);
		dto.setPd_as_remain(pd_as_remain);
		dto.setPd_start_price(pd_start_price);
		dto.setPd_maker_id(pd_maker_id);
		dto.setPd_as_id(pd_as_id);
		dto.setCf_price(cf_price);
		dto.setComments(comments);
		dto.setImd_price(imd_price);
		
		dto.setU_id((String)session.getAttribute("u_id"));
		
		dao.deliveryInsert(dto);
		
		result = "user_mainlist.action";
		
		return result;
		
	}
	
	
	
	
}
