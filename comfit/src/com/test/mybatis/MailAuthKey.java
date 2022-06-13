/*
 * 난수 생성 클래스
 * 
 * */

package com.test.mybatis;

import java.util.Random;

public class MailAuthKey
{
	public String random()
	{
		StringBuffer rs = new StringBuffer();
		
		Random rand = new Random();
		
		String result = "";
		char ch;		
		 for (int i = 1; i <= 10; i++) 
		 {
			 int index = rand.nextInt(3);
			 switch (index)
			{
			case 0:
				 ch = (char) (rand.nextInt(26) + 97);
				 rs.append(ch);
				break;
			case 1:	
				 ch = (char) (rand.nextInt(26) + 65);
				 rs.append(ch);
				break;
			case 2:
				 rs.append(rand.nextInt(10));
				break;
			}
		 }
		result = rs.toString();
		
		return result;		
	}

}
