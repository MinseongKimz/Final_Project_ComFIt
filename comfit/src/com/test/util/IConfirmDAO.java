package com.test.util;

import java.sql.SQLException;

public interface IConfirmDAO
{
	// 직거래 구매확정 (프로시저)
	public int confirmDirectBuy(ConfirmDirectDTO dto) throws SQLException;
	public int confirmDirectSell(ConfirmDirectDTO dto) throws SQLException;
	
}
