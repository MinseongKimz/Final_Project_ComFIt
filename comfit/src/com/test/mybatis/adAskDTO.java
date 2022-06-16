package com.test.mybatis;

public class adAskDTO
{
	private String u_id, ask_title, ask_date, ask_status, answer_date, ask_cate_name, ask_contents;

	public String getAsk_cate_name()
	{
		return ask_cate_name;
	}

	public void setAsk_cate_name(String ask_cate_name)
	{
		this.ask_cate_name = ask_cate_name;
	}

	public String getAsk_contents()
	{
		return ask_contents;
	}

	public void setAsk_contents(String ask_contents)
	{
		this.ask_contents = ask_contents;
	}

	public String getU_id()
	{
		return u_id;
	}

	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}

	public String getAsk_title()
	{
		return ask_title;
	}

	public void setAsk_title(String ask_title)
	{
		this.ask_title = ask_title;
	}

	public String getAsk_date()
	{
		return ask_date;
	}

	public void setAsk_date(String ask_date)
	{
		this.ask_date = ask_date;
	}

	public String getAsk_status()
	{
		return ask_status;
	}

	public void setAsk_status(String ask_status)
	{
		this.ask_status = ask_status;
	}

	public String getAnswer_date()
	{
		return answer_date;
	}

	public void setAnswer_date(String answer_date)
	{
		this.answer_date = answer_date;
	}
	
	
}
