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
	
	// 관리자모드 공지사항 리스트 출력메소드 ok
	public ArrayList<NoticeDTO> noticeList();
	
	// 관리자모드 공지사항 추가 메소드
	public int noticeInsert(NoticeDTO a);
	
	// 관리자모드 공지사항 수정 이동 메소드
	public NoticeDTO noticeModifyForm(String announce_id);
	
	// 관리자모드 공지사항 수정 메소드
	public int noticeModify(NoticeDTO dto);
	
	// 관리자모드 공지사항 삭제 메소드
	public int noticeDelete(String announce_id);
	
	// 관리자모드 공지사항 관리자 카테고리 메소드 ok
	public ArrayList<NoticeDTO> noticecateList();

	
	
	
	
	
	
	
	
	
	
	
	// 관리자모드 상품 출력 메소드
	public ArrayList<adProductDTO> adminProductList();
	
	// 관리자모드 상품 세부 출력 메소드
	public ArrayList<adProductDTO> adminProductDeliveryList();
	
	// 관리자모드 입출금 출력 메소드
	public ArrayList<adMoneyDTO> adminMoneyList();
	
	// 관리자모드 입출금 검색 메소드 구현하기...

	// 관리자모드 FAQ 리스트 출력 메소드
	public ArrayList<FaqDTO> faqList();
	
	// 관리자모드 FAQ 추가 메소드
	public int faqInsert(FaqDTO f);
	
	// 관리자모드 FAQ 수정 폼 접속 메소드
	public FaqDTO faqModifyForm(String faq_id);
	
	// 관리자모드 FAQ 수정 메소드
	public int faqModify(FaqDTO dto);
	
	// 관리자모드 FAQ 삭제 메소드
	public int faqDelete(String faq_id);

}

