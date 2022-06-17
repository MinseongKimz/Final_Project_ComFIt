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
		System.out.println("1");
		SuggestListDTO dto = new SuggestListDTO();
		SuggestDAO dao = new SuggestDAO();
		int sug_count = 0;
		dto.setPrice(request.getParameter("suggest_price"));
		System.out.println(request.getParameter("suggest_price"));
		dto.setSuggest_date(request.getParameter("suggest_date"));
		System.out.println("3");
		dto.setSuggest_time(request.getParameter("suggest_time"));
		System.out.println("3");
		dto.setSuggest_place(request.getParameter("suggest_place"));
		System.out.println("4");
		dto.setPlace_detail(request.getParameter("place_detail"));
		System.out.println("5");
		dto.setU_id(request.getParameter("u_id"));
		System.out.println("6");
		dto.setPd_id(request.getParameter("pd_id"));
		System.out.println("7");
		String pd_id = request.getParameter("pd_id");
		System.out.println("18");
		
		try
		{
			System.out.println("19");
			sug_count = dao.add_suggest(dto);
			System.out.println("20");
			System.out.println("21");
			model.addAttribute("pd_id", pd_id);
			result = "redirect:pd_detail.action";
			return result;
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
				
		return result;		
	}
}
