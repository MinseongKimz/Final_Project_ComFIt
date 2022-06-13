package com.test.mybatis;

import java.util.ArrayList;

public interface IProduct
{
	public ArrayList<ProductDTO> pdList();
	public ArrayList<CategoryDTO> cateList();
	public ArrayList<DirectProductDTO> drPdList(String pd_id);
	public ArrayList<DeliveryProductDTO> dlPdList(String pd_id);
	
}
