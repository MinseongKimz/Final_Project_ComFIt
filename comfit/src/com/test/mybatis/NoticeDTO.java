package com.test.mybatis;

public class NoticeDTO
{
	
	
	/*
	 *  ANNOUNCE_ID       NOT NULL VARCHAR2(20)   
		ANNOUNCE_TITLE    NOT NULL VARCHAR2(60)   
		ANNOUNCE_CONTENTS NOT NULL VARCHAR2(2000) 
		ANNOUNCE_DATE     NOT NULL DATE           
		ANOUN_CATE_ID     NOT NULL NUMBER  
		
		ANOUN_CATE_ID   NOT NULL NUMBER       
		ANOUN_CATE_NAME NOT NULL VARCHAR2(20) 
	 * */
	
	
	//주요 속성 구성
	private String announce_title, announce_contents, anoun_cate_name, announce_id;
	private String anoun_cate_id;
	


	//getter/setter
	

	

	public String getAnnounce_title()
	{
		return announce_title;
	}

	

	public String getAnoun_cate_id()
	{
		return anoun_cate_id;
	}



	public void setAnoun_cate_id(String anoun_cate_id)
	{
		this.anoun_cate_id = anoun_cate_id;
	}



	public String getAnnounce_id()
	{
		return announce_id;
	}

	public void setAnnounce_id(String announce_id)
	{
		this.announce_id = announce_id;
	}

	public void setAnnounce_title(String announce_title)
	{
		this.announce_title = announce_title;
	}

	public String getAnnounce_contents()
	{
		return announce_contents;
	}

	public void setAnnounce_contents(String announce_contents)
	{
		this.announce_contents = announce_contents;
	}
	public String getAnoun_cate_name()
	{
		return anoun_cate_name;
	}

	public void setAnoun_cate_name(String anoun_cate_name)
	{
		this.anoun_cate_name = anoun_cate_name;
	}



	
	
	
	
	
	

	
	
	

	


}
