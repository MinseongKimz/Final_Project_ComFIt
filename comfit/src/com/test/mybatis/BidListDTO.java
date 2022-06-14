package com.test.mybatis;

public class BidListDTO
{
	private String bid_code, u_nickname, price, bid_date, address;

	
	public String getBid_code()
	{
		return bid_code;
	}

	public void setBid_code(String bid_code)
	{
		this.bid_code = bid_code;
	}

	public String getU_nickname()
	{
		return u_nickname;
	}

	public void setU_nickname(String u_nickname)
	{
		this.u_nickname = u_nickname;
	}

	public String getPrice()
	{
		return price;
	}

	public void setPrice(String price)
	{
		this.price = price;
	}

	public String getBid_date()
	{
		return bid_date;
	}

	public void setBid_date(String bid_date)
	{
		this.bid_date = bid_date;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}
	
	
}
