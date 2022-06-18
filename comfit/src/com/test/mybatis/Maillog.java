package com.test.mybatis;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Maillog
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/correct.action", method = RequestMethod.GET)
	public String auth(@RequestParam("auth") String authKey)
	{
		IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class);		
		
		// 여기선 인증키를 받아서 먼저 사용 여부를 확인한다.
		
		try
		{
			String check = dao.checkUseAuth(authKey);
			System.out.println(check);
			
			if (!check.equals("X"))
				return "redirect:comfit.action";
		} catch (Exception e)
		{
			return "redirect:comfit.action";
		}
		
		
		// 체크를 벗어났다면 인증을 시켜주자
		dao.authCheck(authKey);		
		
		// 인증이 완료됬으면 이제 로그인 폼으로 가자.
		
		return "SignWellcom.jsp";		
	}

}
