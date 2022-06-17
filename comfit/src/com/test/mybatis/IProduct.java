package com.test.mybatis;

import java.util.ArrayList;

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
	
	public ArrayList<ProductDTO> non_user_pdList();
	
	public ArrayList<ProductDTO> deli_user_pdList();
	
	public int deli_check_id(String u_id, String pd_id);
	public int dire_check_id(String u_id, String pd_id);
	
	public ArrayList<DirectProductDTO> mgrs(String pd_id);

	// 검색한 리스트 출력하기
	public ArrayList<ProductDTO> search_pdListDefault(String searchKey);
	public ArrayList<ProductDTO> search_pdListPriceH(String searchKey);
	public ArrayList<ProductDTO> search_pdListPriceL(String searchKey);
	public ArrayList<ProductDTO> search_pdListDirect(String searchKey);
	public ArrayList<ProductDTO> search_pdListDelivery(String searchKey);
	
	
	// 직거래 글쓰기 insert
	public int directInsert(directinsertDTO dto);
	

}
