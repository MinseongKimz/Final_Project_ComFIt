package com.test.mybatis;

public class AdminLoginDTO
{
	//주요 속성 구성

	private String ad_id, ad_pw, count;

	//getter/setter 구성
	public String getAd_id()
	{
		return ad_id;
	}

	public void setAd_id(String ad_id)
	{
		this.ad_id = ad_id;
	}

	public String getAd_pw()
	{
		return ad_pw;
	}

	public void setAd_pw(String ad_pw)
	{
		this.ad_pw = ad_pw;
	}

	public String getCount()
	{
		return count;
	}

	public void setCount(String count)
	{
		this.count = count;
	}
	
}
