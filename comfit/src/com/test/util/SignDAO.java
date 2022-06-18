package com.test.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.mybatis.DBConn;
import com.test.mybatis.userDTO;

public class SignDAO implements ISingDAO
{
	private Connection conn;

	@Override
	public int singUser(userDTO dto) throws SQLException
	{
		int result = 0;
		
		try
		{
			///이메일, 이름, 주소, 비번, 전화, 닉네임, 난수코드 /순서 주의!! 
			conn = DBConn.getConnection();
			//System.out.println("gs");
			String sql = "{call REGIT_PRC(?, ?, ?, ?, ?, ?, ?)}";
			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			
			cstmt.setString(1, dto.getU_email());
			cstmt.setString(2, dto.getU_name());
			cstmt.setString(3, dto.getU_address());
			cstmt.setString(4, dto.getU_password());
			cstmt.setString(5, dto.getU_tel());
			cstmt.setString(6, dto.getU_nickname());
			cstmt.setString(7, dto.getRandom());
			
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
	public userDTO findEmail(userDTO dto) throws SQLException
	{	
		userDTO user = new userDTO();
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "SELECT U_EMAIL, U_JOINDATE" + 
						 " FROM USER_INFORMATION" + 
						 " WHERE U_TEL  = ? AND U_NAME= ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//System.out.println("//"+dto.getU_tel());
			
			pstmt.setString(1, dto.getU_tel());
			pstmt.setString(2, dto.getU_name());
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				user.setU_email(rs.getString("U_EMAIL"));
				user.setU_joindate(rs.getString("U_JOINDATE"));
			}
			
			rs.close();
			pstmt.close();
			
			
			
		} catch (Exception e)
		{
			DBConn.close();
			System.out.println(e.toString());
		}
		
		DBConn.close();
		//System.out.println("디비접속종료");
		return user;
	}
	
	
	
	// 비밀번호 찾기 메소드
	public int findPassword(userDTO dto) throws SQLException
	{
		int result = 0;
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "SELECT COUNT(*) AS COUNT FROM USER_INFORMATION"
						+ " WHERE U_EMAIL = ?"
						+ " AND U_TEL = ?"
						+ " AND U_NAME = ?";
				
		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getU_email() );
			pstmt.setString(2, dto.getU_tel());
			pstmt.setString(3, dto.getU_name());
			
			ResultSet rs = pstmt.executeQuery();
			
			
			while (rs.next())
				result = Integer.parseInt(rs.getString("COUNT"));
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				DBConn.close();;
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}	
		}
		
		
		return result;
	}
	
	// 인증 키 생성
	public int makepwAuth(String u_email, String random) throws SQLException
	{
		int result = 0;
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "INSERT INTO USER_EMAIL_AUTH(E_AUTH_ID, AUTH_CODE, U_ID, AU_CATE_ID )"
					+ " VALUES(CONCAT('auth_', USER_EMAIL_AUTH_SEQ.NEXTVAL)"
					+ ", ? ,(SELECT C.U_ID FROM COMFIT_USER C"
					+ " JOIN USER_INFORMATION U ON C.U_ID = U.U_ID WHERE U.U_EMAIL = ?), 2)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, random);
			pstmt.setString(2, u_email);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally {
			try
			{
				DBConn.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return result;
	}
	
	// PW 인증키 사용 여부 체크 메소드
	public int checkUsePwAuth(String random) throws SQLException
	{
		int result = 0;
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "SELECT COUNT(*) AS COUNT FROM USER_EMAIL_AUTH"
					+ " WHERE AUTH_CODE = ? AND auth_use_date IS NULL";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, random);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
				result = rs.getInt("COUNT");
			
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally {
			try
			{
				DBConn.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return result;
		
	}
	
	// 어쓰키 (비밀번호 인증 메일 사용 찍기)
	public int updatePwAuth(String random) throws SQLException
	{
		int result = 0;
		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "UPDATE USER_EMAIL_AUTH SET AUTH_USE_DATE = SYSDATE WHERE AUTH_CODE = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, random);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally {
			try
			{
				DBConn.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return result;
	}
	
	public int changePassword(String auth, String password) throws SQLException
	{
		int result = 0;

		
		try
		{
			conn = DBConn.getConnection();
			
			String sql = "UPDATE USER_INFORMATION SET U_PASSWORD = CRYPTPACK.ENCRYPT(?,?)"
					+ " WHERE U_ID = (SELECT U_ID FROM USER_EMAIL_AUTH WHERE AUTH_CODE=?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, password);
			pstmt.setString(2, password);
			pstmt.setString(3, auth);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally {
			try
			{
				DBConn.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return result;
	}
	
}
