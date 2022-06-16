package com.test.mybatis;

public class ProductDTO
{
	private String pd_id, pd_name, price, distatnce;
	
	private String lat, lon;
	
	
	public String getLat()
	{
		return lat;
	}

	public void setLat(String lat)
	{
		this.lat = lat;
	}

	public String getLon()
	{
		return lon;
	}

	public void setLon(String lon)
	{
		this.lon = lon;
	}

	public String getDistatnce()
	{
		return distatnce;
	}

	public void setDistatnce(String distatnce)
	{
		this.distatnce = distatnce;
	}

	public String getPd_id()
	{
		return pd_id;
	}

	public void setPd_id(String pd_id)
	{
		this.pd_id = pd_id;
	}

	public String getPd_name()
	{
		return pd_name;
	}

	public void setPd_name(String pd_name)
	{
		this.pd_name = pd_name;
	}

	public String getPrice()
	{
		return price;
	}

	public void setPrice(String price)
	{
		this.price = price;
	}

	
	
}

