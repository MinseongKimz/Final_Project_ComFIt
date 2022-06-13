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
	
	// 관리자모드 카테고리 삭제 메소드
	public int categoryDelete(int pd_category_id);
	
	// 관리자모드 탈퇴한 회원 리스트 출력 메소드
	public ArrayList<useroutDTO> adminUseroutList();
	
	// 관리자모드 상품 출력 메소드
	public ArrayList<adProductDTO> adminProductList();

	// 관리자모드 FAQ 리스트 출력 메소드
	public ArrayList<FaqDTO> faqList();
	
	// 관리자모드 FAQ 추가 메소드
	public int faqInsert(FaqDTO f);
	
	// 관리자모드 FAQ 수정 폼 접속 메소드
	public FaqDTO faqModifyForm(String faq_id);
	
	// 관리자모드 FAQ 수정 메소드
	public int faqModify(FaqDTO dto);

}

