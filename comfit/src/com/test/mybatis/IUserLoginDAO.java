package com.test.mybatis;


public interface IUserLoginDAO
{
	// 유저 로그인 
	public userDTO userLogin(userDTO dto);
	
	// 이메일 인증 X → 이메일 인증 필요 페이지 출력 위한 이메일 추출
	public userDTO userEmail(userDTO dto);
	
	// 닉네임 중복 체크
	public int nickCheck(String nickName);
	
	// 이메일 중복 체크
	public int emailCheck(String email);
	
	// U_ID 생성 
	public int makeId();
	
	// USER_INFORMATION 생성
	public int insertUserInfo(userDTO dto);
	
	// 이메일 인증 생성
	public int insertAuth(userDTO dto);
	
	// 가장 최근 U_ID 찾기
	public String searchId();
	
	// 이메일 인증 키 사용 여부 체크
	public String checkUseAuth(String authKey);
	
	// 이메일 인증 하기(변경쿼리)
	public int authCheck(String authKey);
	
	
	
}
