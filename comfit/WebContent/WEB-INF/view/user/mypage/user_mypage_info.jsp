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
<title>내 정보 확인/수정</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">

	.subheader
	{
		font-size: 25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:5%;
	}
	.subheader_header
	{
		font-size: 20pt;
		font-weight: bold;
		margin-left: 25%;
	}
	
	.tablebts
	{
		width:30%;
		margin-left:40%;
		border-radius:5px;
		table-layout:fixed;
    	font-weight: bold;
    	background-color: #FFFFFF;
    	outline: 1px solid #E0E6F8;
    	
  	}
  	
  	.hi
  	{
  		margin-left: 38%;
  	}
  	
  	.title
	{
		margin-left: 11%;
		font-family: 맑은 고딕;
		font-size: 30pt;
	}
	.list-group 
	{
		width: 120px;
		text-align: center;
	}
	.list-group-item 
	{
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
<div>
		<!--Header  -->
		<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	   	</div>
	   	<div>
	   		<p class="subheader">마이페이지</p>
	   		<p class="subheader_header">회원정보</p>
	   	</div>
				<div style="float:left; margin-left:15%;">
								<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
				</div>		  
				<div>
					
				</div> 			
	   				<table class="tablebts"  style="colspan:2;">
	   								<tr>
	   									<th>
	   										<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 70%; width: 70%; margin-left:120%;">
	   									</th>
	   								</tr>
							        <tr>
							          <td>이메일</td><td>Test@gmail.com</td>
							        </tr>
							        <tr>
							          <td>이름</td><td>김민성</td>
							        </tr>
							        <tr>
							          <td>닉네임</td><td>김인성</td>
							        </tr>
							        <tr>
							          <td>레벨</td><td>5</td>
							        </tr>
							        <tr>
							          <td>비밀번호</td><td>T******</td>
							          <td><button type="button" class="btn btn-primary btn-sm"id="btn" style="margin-left:45%;">변경하기</button></td>
							        </tr>
							        <tr>
							          <td>휴대폰번호</td><td>010-1111-1111</td>
							          <td><button type="button" class="btn btn-primary btn-sm"id="btn" style="margin-left:45%;">변경하기</button></td>
							        </tr>
							        <tr>
							          <td>주소</td><td>서울시 서초구..</td>
							          <td><button type="button" class="btn btn-primary btn-sm"id="btn" style="margin-left:45%;">변경하기</button></td>
							        </tr>
					    	</table>
	  			</div>
	  

</body>
</html>