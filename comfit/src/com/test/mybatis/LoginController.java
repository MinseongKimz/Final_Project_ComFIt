package com.test.mybatis;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/login.action" ,method = RequestMethod.POST)
	public String login(userDTO dto,  Model model, HttpServletRequest request)
	{
		IUserLoginDAO dao = sqlSession.getMapper(IUserLoginDAO.class); 
		userDTO user = new userDTO(); 
		//System.out.println(email + password);
		try
		{
			user = dao.userLogin(dto);
			//System.out.println(user.getAuth());	
			
			if(user.getAuth().equals("0")) // 이메일 인증이 안됬다면...
			{
				 user = dao.userEmail(user);
				 
				 model.addAttribute("email", user.getU_email());
				 model.addAttribute("nickname", user.getU_nickname());
				 
				 return "/WEB-INF/view/user/main/user_email_auth.jsp";
				
			}	
			else 
			{
				
				HttpSession session = request.getSession();
				session.setAttribute("u_id", user.getU_id());
				

				
				System.out.println(session.getAttribute("u_id"));
				
				//session.setAttribute("lat");
				//session.setAttribute("lon");

				String result = null;
				result = "user_mainlist.action"; // 링크를 통한 매핑 처리 필요, 거기서는 세션 확인해야함.
				return result;
			}	
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
			return "loginform.action";
		}
	}
	
	
	@RequestMapping("/logout.action")
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:comfit.action";
	}
}
