package com.test.util;

import java.sql.SQLException;

import com.test.mybatis.BidListDTO;
import com.test.mybatis.SuggestListDTO;
import com.test.mybatis.SuggestUserDTO;

public interface ISuggestDAO
{
	public int add_suggest(SuggestListDTO dto) throws SQLException;
	public int add_bid(BidListDTO dto) throws SQLException;
	public String getB_code(SuggestUserDTO dto) throws SQLException;
}
