/*====================================
 	Sample.java
 	- 컨트롤러 객체
 ====================================*/



package com.test.mybatis;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddressController
{
	
	@RequestMapping(value = "/address_find.action", method = RequestMethod.GET)
	public String hello(Model model)
	{
		String result = null;
		
		result="/WEB-INF/view/user/main/user_address_find.jsp";
		
		return result;
	}
	
}
