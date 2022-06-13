package com.test.mybatis;

public class adMoneyDTO
{
	
	private String io_type, u_email, u_name, io_date, bank_name, account, money;

	public String getIo_type()
	{
		return io_type;
	}

	public void setIo_type(String io_type)
	{
		this.io_type = io_type;
	}

	public String getU_email()
	{
		return u_email;
	}

	public void setU_email(String u_email)
	{
		this.u_email = u_email;
	}

	public String getU_name()
	{
		return u_name;
	}

	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}

	public String getIo_date()
	{
		return io_date;
	}

	public void setIo_date(String io_date)
	{
		this.io_date = io_date;
	}

	public String getBank_name()
	{
		return bank_name;
	}

	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	public String getMoney()
	{
		return money;
	}

	public void setMoney(String money)
	{
		this.money = money;
	}
	
	
	
	
	/*
	 * SELECT IO_TYPE, U_EMAIL, U_NAME, IO_DATE, BANK_NAME , ACCOUNT, MONEY FROM
	 * AD_IO_MONEY_LIST_REALVIEW ORDER BY IO_DATE;
	 */
}
