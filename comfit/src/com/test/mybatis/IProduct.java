package com.test.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.test.util.ConfirmDeliveryDTO;
import com.test.util.ConfirmDirectDTO;

public interface IProduct
{
	public ArrayList<ProductDTO> user_pdList(ProductDTO dto);
	public ArrayList<CategoryDTO> cateList();
	public ArrayList<DirectProductDTO> drPdList(String pd_id);
	public ArrayList<DeliveryProductDTO> dlPdList(String pd_id);
	public ArrayList<BidListDTO> bidList(String pd_id);

	public ArrayList<searchResultDTO> searchResult(searchResultDTO dto);
	
	//판매등록 글쓰기에서 카테고리 리스트 select option list 출력 메소드
	public ArrayList<CategoryDTO> categoryList();

	public ArrayList<SuggestListDTO> suggestList(String pd_id);
	
	// 판매등록 글쓰기에서 제조사 리스트 select option list 출력 메소드 
	public ArrayList<MakerDTO> makerList(String optionValue);
	
	// 레벨 뽑기
	public int userLevel(String userId);
	
	// 특정 상품의 id 뽑기
	public String deliuserId(String pd_id);
	public String direuserId(String pd_id);
	
	public ArrayList<MakerDTO> makerList2(String optionValue);
	
	// 배송거래 글쓰기 insert
	public int deliveryInsert(deliveryInsertDTO dto);
	
	// 판매횟수 뽑기
	public int sellCount(String userId);
	
	// 비회원 상품리스트
	public ArrayList<ProductDTO> non_user_pdList();
	
	// 택배 상품리스트
	public ArrayList<ProductDTO> deli_user_pdList();
	// 택배경매종료일
	public int end_date(String pd_id);
	
	// 내 입찰여부
	public int ub_Check(SuggestUserDTO dto);
	
	// 낙찰된상품인지의 여부
	public int buy_count(String pd_id);
	
	public int deli_check_id(String u_id, String pd_id);
	public int dire_check_id(String u_id, String pd_id);
	
	public ArrayList<DirectProductDTO> mgrs(String pd_id);

	// 검색한 리스트 출력하기
	public ArrayList<ProductDTO> search_pdListDefault(String searchKey);
	public ArrayList<ProductDTO> search_pdListPriceH(String searchKey);
	public ArrayList<ProductDTO> search_pdListPriceL(String searchKey);
	public ArrayList<ProductDTO> search_pdListDirect(String searchKey);
	public ArrayList<ProductDTO> search_pdListDelivery(String searchKey);
	
	// 카테고리선택
	public ArrayList<ProductDTO> categorySelect(String categoryName);
	
	
	// 직거래 글쓰기 insert
	public int directInsert(directinsertDTO dto);
	
	// 직거래 채택
	public int selectSuggest(String suggest_code);
	
	// 택배거래 구매확정
	public int confirmDeliveryBuy(ConfirmDeliveryDTO dto);
	
	// 택배거래 판매확정
	public int confirmDeliverySell(ConfirmDeliveryDTO dto);
	
	// 직거래 조건확인
	public String sugCheck(String pd_id);

	public int selCheck(String pd_id);
	public int slCheck(String pd_id);
	public int usCheck(SuggestUserDTO su);
	public int add_buy(String bid_code);
	public int bsCheck(SuggestUserDTO su);
	public int final_price(String pd_id);
	
	public int end_day(String pd_id);
	public int now_price(String pd_id);
	public int blCheck(String pd_id);


}
	