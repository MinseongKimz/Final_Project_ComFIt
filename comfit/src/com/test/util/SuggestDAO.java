package com.test.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.test.mybatis.BidListDTO;
import com.test.mybatis.DBConn;
import com.test.mybatis.SuggestListDTO;
import com.test.mybatis.SuggestUserDTO;

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
	
	@Override
	public int add_bid(BidListDTO dto)
	{
		int result = 0;
		
		try
		{
			
			conn = DBConn.getConnection();
			
			String sql = "{call ADD_BID(?, ?, ?, ?, ?)}";
			
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			
			cstmt.setInt(1, Integer.parseInt(dto.getPrice()));
			cstmt.setString(2, dto.getAddress());
			cstmt.setString(3, dto.getAddr_detail());
			cstmt.setString(4, dto.getU_id());
			cstmt.setString(5, dto.getPd_id());
			
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
	
	@Override
	public String getB_code(SuggestUserDTO dto)
	{
		String result = "";
		
		try
		{
			
			conn = DBConn.getConnection();
			String sql = "SELECT BID_CODE FROM BID_LIST WHERE DELI_PD_ID = ? AND U_ID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPd_id());
			pstmt.setString(2, dto.getU_id());
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result = rs.getString("BID_CODE");
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
}
