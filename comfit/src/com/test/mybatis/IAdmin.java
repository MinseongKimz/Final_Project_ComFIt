package com.test.mybatis;

import java.util.ArrayList;

public interface IAdmin
{
	// 관리자모드 회원 리스트 출력 메소드
	public ArrayList<userDTO> adminUserList();
	
	// 관리자모드 차단 회원 리스트 출력 메소드
	public ArrayList<userDTO> adminBannedList();
	
	// 관리자모드 카테고리 리스트 출력 메소드
	public ArrayList<CategoryDTO> categoryList();
	
	// 관리자모드 카테고리 추가 메소드
	public int categoryInsert(String category_name);
	
	public int categoryDelete(int pd_category_id);
	

}

