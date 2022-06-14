package com.test.mybatis;

import java.util.ArrayList;

public interface IUserMyPage
{
	// 유저 개인정보
	public userDTO myDetailInfo(String u_id);
	public userDTO myInfo(String u_id);
	public ArrayList<MoneyDTO> myMoneyList(String u_id);
	public int myPoint(String u_id);
	
}
