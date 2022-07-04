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
	private SqlSession sqlSession;
	
	// 검색 기능
	@RequestMapping(value="/searchlist.action", method = RequestMethod.GET)
	public String search_list(Model model, @RequestParam("searchKey") String searchKey
										 , @RequestParam("sort") int sort)
	{
		String result = null;
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		model.addAttribute("sort", sort);
		model.addAttribute("searchKey", searchKey);
		searchKey = "%" + searchKey + "%";


		switch (sort)
		{
			case 1: model.addAttribute("searchList", dao.search_pdListDefault(searchKey));
					break;
			case 2: model.addAttribute("searchList", dao.search_pdListPriceH(searchKey));
					break;
			case 3: model.addAttribute("searchList", dao.search_pdListPriceL(searchKey));
					break;
			case 4: model.addAttribute("searchList", dao.search_pdListDirect(searchKey));
					break;
			case 5: model.addAttribute("searchList", dao.search_pdListDelivery(searchKey));
					break;
			
			default: break;
		}
		
		result = "/WEB-INF/view/user/main/user_search_list2.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "search_listScroll.action", method = RequestMethod.GET)
	public String search_listScroll(Model model, HttpServletRequest request)
	{
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		int sort = Integer.parseInt(request.getParameter("sort"));
		
		try
		{
			ProductDTO dto = new ProductDTO();
			
			String searchKey = request.getParameter("searchKey");
			String lastbno = request.getParameter("lastbno");
			if (searchKey == null)
			{
				searchKey = "%%";
			}
			System.out.println(searchKey);
			System.out.println(lastbno);
			System.out.println(sort);
			dto.setLastbno(lastbno);
			dto.setSearchKey(searchKey);
			switch (sort)
			{
			case 1:
				model.addAttribute("scrollList", dao.search_pdListDefaultScroll(dto));
				break;
			case 2:
				model.addAttribute("scrollList", dao.search_pdListPriceHScroll(dto));
				break;	
			case 3:
				model.addAttribute("scrollList", dao.search_pdListPriceLScroll(dto));
				break;
			case 4:
				model.addAttribute("scrollList", dao.search_pdListDirectScroll(dto));
				break;
			case 5:
				model.addAttribute("scrollList", dao.search_pdListDeliveryScroll(dto));
				break;
				
			default: break;

			}
			
		result = "/WEB-INF/view/user/main/user_scroll_list.jsp";
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

	
	
	// 검색기능 int만 넘겨줬을때
	@RequestMapping(value="/sortlist.action", method = RequestMethod.GET)
	public String search_list(Model model, @RequestParam("sort") int sort)
	{
		String result = null;
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		model.addAttribute("sort", sort);
		
		String searchKey = "%%";
		model.addAttribute("searchKey", searchKey);

		switch (sort)
		{
			case 1: model.addAttribute("searchList", dao.search_pdListDefault(searchKey));
					break;
			case 2: model.addAttribute("searchList", dao.search_pdListPriceH(searchKey));
					break;
			case 3: model.addAttribute("searchList", dao.search_pdListPriceL(searchKey));
					break;
			case 4: model.addAttribute("searchList", dao.search_pdListDirect(searchKey));
					break;
			case 5: model.addAttribute("searchList", dao.search_pdListDelivery(searchKey));
					break;
			
			default: break;
		}
		
		result = "/WEB-INF/view/user/main/user_search_list2.jsp";
		
		return result;
	}
	
	// 회원 카테고리 선택
	@RequestMapping(value = "categorySelect.action", method = RequestMethod.GET)
	public String categorySelect(Model model, @RequestParam("categoryName") String categoryName)
	{
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
		try
		{
			model.addAttribute("categoryName", categoryName);
			model.addAttribute("searchList", dao.categorySelect(categoryName));
			model.addAttribute("sort", 1);
			
			result = "/WEB-INF/view/user/main/user_search_list.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}
	
	// 회원 카테고리 선택 후 스크롤 내리면
	@RequestMapping(value = "categorySelectScroll.action", method = RequestMethod.GET)
	public String categorySelectScroll(Model model, HttpServletRequest request)
	{
		String result = null;
		IProduct dao = sqlSession.getMapper(IProduct.class);
		try
		{
			ProductDTO dto = new ProductDTO();
			dto.setCategory_name(request.getParameter("categoryName"));
			dto.setLastbno(request.getParameter("lastbno"));
			model.addAttribute("scrollList", dao.categorySelectScroll(dto));
			result = "/WEB-INF/view/user/main/user_scroll_list.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

	
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
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
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
		
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
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
		IProduct dao = sqlSession.getMapper(IProduct.class);
		
		model.addAttribute("categorylist", dao.categoryList());
		model.addAttribute("makerlist", dao.makerList(category));
		
		model.addAttribute("name", name);					// 물품명
		model.addAttribute("mk", maker);					// 제조사
		model.addAttribute("realAvgPrice", realAvgPrice);	// 평균가격
		model.addAttribute("cate", category);				// 카테고리
		
		
		return "/WEB-INF/view/user/main/user_direct_seller_edit.jsp";
	}

	
	
	
}
