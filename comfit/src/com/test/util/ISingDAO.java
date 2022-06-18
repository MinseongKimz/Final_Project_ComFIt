// 회원가입 인터페이스
// 작성자 : 김민성


package com.test.util;

import java.sql.SQLException;

import com.test.mybatis.userDTO;

public interface ISingDAO
{
	public int singUser(userDTO dto) throws SQLException;
	public userDTO findEmail(userDTO dto) throws SQLException;
	public int findPassword(userDTO dto) throws SQLException;
	public int makepwAuth(String u_email, String random) throws SQLException;
	public int checkUsePwAuth(String random) throws SQLException;
	public int updatePwAuth(String random) throws SQLException;
	public int changePassword(String auth, String password) throws SQLException;
	
	
}
