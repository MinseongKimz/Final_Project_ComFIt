/*
System.out.println(name);
System.out.println(category);
System.out.println(maker);
System.out.println(cfPrice);
 */

package com.test.mybatis;

public class searchResultDTO
{
	private String name, category, maker, cfPrice;
	
	

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCategory()
	{
		return category;
	}

	public void setCategory(String category)
	{
		this.category = category;
	}

	public String getMaker()
	{
		return maker;
	}

	public void setMaker(String maker)
	{
		this.maker = maker;
	}

	public String getCfPrice()
	{
		return cfPrice;
	}

	public void setCfPrice(String cfPrice)
	{
		this.cfPrice = cfPrice;
	}
	
	
}
