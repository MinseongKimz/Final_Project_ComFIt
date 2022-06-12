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
<title>비밀번호 수정</title>
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
		border-radius:5px;
		margin-top:5%;
		margin-left: 15%;
    	width: 40%;
    	font-weight: bold;
  	}
  	.hi
  	{
  		border-radius:5px;
  		margin-left:-20%;
  		width:80%;
  	}
  	
  	
</style>

</head>
<body>
<div>
		<!--Header  -->
		<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	   	</div>
	   	
	   	<!--Content  -->
	   	<div>
	   		<p class="subheader">마이페이지</p>
	   		<p class="subheader_header">회원정보</p>
	   		<div style="float:left; margin-left:15%;">
	   		<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp"></c:import>
	   		</div>
	   	</div>
	   
	   	<table class="tablebts" style="float: left;">
	   		<tr>
	   			<td>현재비밀번호</td><td><input type="text" class="hi" placeholder="비밀번호를 입력하세요" /></td>
	   		</tr>
	   		<tr>
	   			<td>새 비밀번호</td><td><input type="text" class="hi" placeholder="새비밀번호를 입력하세요" /></td>
	   		</tr>
	   		<tr>
	   			<td>새 비밀번호 확인</td><td><input type="text" class="hi" placeholder="새비밀번호를 한 번더 입력하세요" /></td>
	   		</tr>
	   		<tr>
	   			<td>
	   			
	   			<button class="btn btn-primary" style="margin-left: 80%; width: 150px; margin-top:5%;"
								data-bs-toggle="modal" data-bs-target="#check"
								>확인</button>
	   			</td>
	   		</tr>
	   	</table>
	   	
	   	
		<!-- Modal 입금 확인 -->
		<div class="modal fade" id="check" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		         <h3 style="color: #0000ff; font-weight: bold;">Comfit</h3><br />
		         
		         <span class="ibgum" style="font-size: 15px;">비밀번호 수정이 완료되었습니다.</span><br />
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>

	   	
</div>

</body>
</html>