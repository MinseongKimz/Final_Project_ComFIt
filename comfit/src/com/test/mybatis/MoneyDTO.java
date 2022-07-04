package com.test.mybatis;

public class MoneyDTO
{
	private String u_id, m_date, inout, start, end;
	private int m_money;
	
	
	public String getStart()
	{
		return start;
	}
	public void setStart(String start)
	{
		this.start = start;
	}
	public String getEnd()
	{
		return end;
	}
	public void setEnd(String end)
	{
		this.end = end;
	}
	public String getU_id()
	{
		return u_id;
	}
	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}
	public String getM_date()
	{
		return m_date;
	}
	public void setM_date(String m_date)
	{
		this.m_date = m_date;
	}
	public String getInout()
	{
		return inout;
	}
	public void setInout(String inout)
	{
		this.inout = inout;
	}
	public int getM_money()
	{
		return m_money;
	}
	public void setM_money(int m_money)
	{
		this.m_money = m_money;
	}
	
}
