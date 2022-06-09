<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 PW찾기</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.subheader
	{
		font-size: 25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:5%;
	}
	.pwcheck
	{
		color:#0080FF;
		font-size: 20pt;
		font-weight: bold;
		margin-left: 45%;
		margin-top:5%;
	}
	.check
	{
		font-size: 20pt;
		font-weight: bold;
		margin-left: 32%;
	}
	.pwinsert
	{
		border-radius:5px;
		width:250px;
		height:30pt;
		margin-left:43%;
	}
	.btn-primary
	{
		background:black;
		color:white;
	}
	.btns
	{
		margin-top:2%;
		margin-left:38%;
	}
</style>
</head>
<body>

		<div>
			<!--Header  -->
			<div class="header">
		      <c:import url="comfit_header.jsp"></c:import>
		   	</div>
		   	
		   	<div>
		   		<p class="subheader">마이페이지</p>
		   	</div>
		</div>
		<div>
			<p class="pwcheck">비밀번호 확인</p>
			<p class="check">현재 사용하고 계시는 비밀번호를 입력해주세요</p>
			<input type="text" class="pwinsert" placeholder="비밀번호를 입력해주세요"/>
			<input type="text" class="errMsg" placeholder="입력하신 비밀번호가 일치하지 않습니다. 다시 입력해주세요" style="color:red; display: none;"/>
		</div>
		<div class="btns">
			<button type="button" class="btn btn-primary btn-sm"id="buyBtn" style="width: 200px; height: 40px; font-size: 15pt;">확인</button>
			<button type="button" class="btn btn-primary btn-sm"id="buyBtn" style="width: 200px; height: 40px; font-size: 15pt;">취소</button>
		</div>
</body>
</html>