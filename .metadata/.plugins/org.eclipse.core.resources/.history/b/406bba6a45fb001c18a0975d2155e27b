package com.test.mybatis;

import java.util.ArrayList;

public interface IUserMyPage
{
	// 회원 마이페이지 
	public userDTO myDetailInfo(String u_id);
	public userDTO myInfo(String u_id);
	public ArrayList<MoneyDTO> myMoneyList(String u_id);
	public int myPoint(String u_id);
	public int myLevel(String u_id);
	public ArrayList<MypageProductDTO> sellList(String u_id); 
	public ArrayList<MypageProductDTO> buyList(String u_id); 
	public int changeProfile(userDTO dto);
	public String nameSearch(String u_id);
	public int insertMoney(insertMoneyDTO dto);	// 입금
	public ArrayList<BankDTO> bankList();	// 은행리스트 뿌려주기
	public int outMoney(OutMoneyDTO dto); 	// 출금
}
