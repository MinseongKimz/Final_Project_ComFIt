package com.test.mybatis;

import java.util.ArrayList;

public interface IProduct
{
	public ArrayList<ProductDTO> pdList();
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
	
	
	public ArrayList<MakerDTO> makerList2(String optionValue);
	
	public int deliveryInsert(deliveryInsertDTO dto);
	

}
