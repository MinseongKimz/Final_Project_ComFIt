package com.test.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import com.test.mybatis.DBConn;

public class ConfirmDAO implements IConfirmDAO
{
	private Connection conn;

	@Override
	public int confirmDirectBuy(ConfirmDirectDTO dto) throws SQLException
	{
		int result = 0;
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "{call DIREBUY_COMPLETE_PRC(?, ?, ?)}";
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, dto.getSelected_id());
			cstmt.setString(2, dto.getSeller_code());
			cstmt.setString(3, dto.getReview());
			
			result = cstmt.executeUpdate();
			
			cstmt.close();
			
		} catch (Exception e)
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
	
	@Override
	public int confirmDirectSell(ConfirmDirectDTO dto) throws SQLException
	{
		int result = 0;
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "{call DIRESELL_COMPLETE_PRC(?, ?, ?)}";
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, dto.getSelected_id());
			cstmt.setString(2, dto.getBuyer_code());
			cstmt.setString(3, dto.getReview());
			
			result = cstmt.executeUpdate();
			
			cstmt.close();
			
		} catch (Exception e)
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
