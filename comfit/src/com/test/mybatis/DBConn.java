/*
 * AJAX 위한...
 * */
package com.test.mybatis;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection()
	{
		if (dbConn==null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@118.46.221.21:1521:xe";
				String user = "comfit";
				String pwd = "comfit006$";
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				dbConn = DriverManager.getConnection(url, user, pwd);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}
	
	public static Connection getConnection(String url, String user, String pwd)
	{
		if (dbConn==null)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				dbConn = DriverManager.getConnection(url, user, pwd);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return dbConn;
	}
	
	public static void close()
	{
		if (dbConn!=null)
		{
			try
			{
				if(!dbConn.isClosed())
					dbConn.close();
					
					
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		dbConn = null;
	}
	
}
