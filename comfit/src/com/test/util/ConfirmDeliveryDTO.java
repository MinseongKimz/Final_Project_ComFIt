package com.test.util;

public class ConfirmDeliveryDTO
{
	private String bs_id, buyer_code, seller_code, review, deli_num;

	public String getDeli_num()
	{
		return deli_num;
	}

	public void setDeli_num(String deli_num)
	{
		this.deli_num = deli_num;
	}

	public String getBs_id()
	{
		return bs_id;
	}

	public void setBs_id(String bs_id)
	{
		this.bs_id = bs_id;
	}

	public String getBuyer_code()
	{
		return buyer_code;
	}

	public void setBuyer_code(String buyer_code)
	{
		this.buyer_code = buyer_code;
	}

	public String getSeller_code()
	{
		return seller_code;
	}

	public void setSeller_code(String seller_code)
	{
		this.seller_code = seller_code;
	}

	public String getReview()
	{
		return review;
	}

	public void setReview(String review)
	{
		this.review = review;
	}
	
	
}
