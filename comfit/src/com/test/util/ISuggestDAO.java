package com.test.util;

import java.sql.SQLException;

import com.test.mybatis.SuggestListDTO;

public interface ISuggestDAO
{
	public int add_suggest(SuggestListDTO dto) throws SQLException; 
}
