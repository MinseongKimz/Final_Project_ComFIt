package com.test.util;

import java.sql.CallableStatement;
import java.sql.Connection;

import com.test.mybatis.DBConn;
import com.test.mybatis.SuggestListDTO;

public class SuggestDAO implements ISuggestDAO
{
	private Connection conn;
	
	@Override
	public int add_suggest(SuggestListDTO dto)
	{
		int result = 0;
		
		try
		{
			// 
			conn = DBConn.getConnection();
			
			String sql = "{call ADD_SUGGEST(?, ?, ?, ?, ?, ?, ?)}";
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			
			cstmt.setInt(1, Integer.parseInt(dto.getPrice()));
			cstmt.setString(2, dto.getSuggest_date());
			cstmt.setString(3, dto.getSuggest_time());
			cstmt.setString(4, dto.getSuggest_place());
			cstmt.setString(5, dto.getPlace_detail());
			cstmt.setString(6, dto.getU_id());
			cstmt.setString(7, dto.getPd_id());
			
			result = cstmt.executeUpdate();
			
			cstmt.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				DBConn.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return result;
	}
	
}
