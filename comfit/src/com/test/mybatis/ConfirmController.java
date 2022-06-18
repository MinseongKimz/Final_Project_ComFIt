package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.util.ConfirmDAO;
import com.test.util.ConfirmDirectDTO;
import com.test.util.IConfirmDAO;

@Controller
public class ConfirmController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 카테고리 insert
	@RequestMapping(value = "/completebuy.action", method = RequestMethod.POST)
	public String categoryInsert(ConfirmDirectDTO dto ,Model model)
	{
		String result = null;
		
		ConfirmDAO dao = new ConfirmDAO();
		
		int count = 0;
		
		try
		{
			count = dao.confirmDirect(dto);
			
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
	
}
