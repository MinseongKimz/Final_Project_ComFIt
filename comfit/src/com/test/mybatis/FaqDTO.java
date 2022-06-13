package com.test.mybatis;

public class FaqDTO
{
	
	// faq 주요 속성 구성
	private String faq_id, faq_title, faq_contents;

	
	// getter setter 구성
	public String getFaq_id()
	{
		return faq_id;
	}

	public void setFaq_id(String faq_id)
	{
		this.faq_id = faq_id;
	}

	public String getFaq_title()
	{
		return faq_title;
	}

	public void setFaq_title(String faq_title)
	{
		this.faq_title = faq_title;
	}

	public String getFaq_contents()
	{
		return faq_contents;
	}

	public void setFaq_contents(String faq_contents)
	{
		this.faq_contents = faq_contents;
	}
	
	
	
}
