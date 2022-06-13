package com.test.mybatis;


public interface IUserLoginDAO
{
	// 유저 로그인 
	public userDTO userLogin(userDTO dto);
	
	// 이메일 인증 X → 이메일 인증 필요 페이지 출력 위한 이메일 추출
	public userDTO userEmail(userDTO dto);
}
