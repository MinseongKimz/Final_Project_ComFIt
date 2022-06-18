package com.test.mybatis;

public class BidListDTO
{
	private String bid_code, u_nickname, price, bid_date, address, addr_detail
	, u_id, pd_id, profile;
	
	public String getPd_id()
	{
		return pd_id;
	}

	public void setPd_id(String pd_id)
	{
		this.pd_id = pd_id;
	}

	public String getAddr_detail()
	{
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail)
	{
		this.addr_detail = addr_detail;
	}

	public String getU_id()
	{
		return u_id;
	}

	public void setU_id(String u_id)
	{
		
		this.u_id = u_id;
	}

	public String getProfile()
	{
		return profile;
	}

	public void setProfile(String profile)
	{
		this.profile = profile;
	}

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
