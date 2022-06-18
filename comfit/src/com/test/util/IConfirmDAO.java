package com.test.util;

import java.sql.SQLException;

public interface IConfirmDAO
{
	// 직거래 구매확정
	public int confirmDirect(ConfirmDirectDTO dto) throws SQLException;
}
