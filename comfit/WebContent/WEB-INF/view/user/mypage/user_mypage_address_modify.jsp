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
<title>주소 번호 수정</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


	$(document).ready(function()
	{
		$("#btn-modify-success").click(function()
		{
			location.href="user_information.action";
		})
	})
	

</script>
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
		margin-top:5%;
		margin-left: 38%;
    	width: 40%;
    	font-weight: bold;
  	}
  	.hi
  	{
  		margin-left:3%;
  		border-radius:5px;
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
	   	
	   	
	   	<div>
	   		<p class="subheader">마이페이지</p>
	   		<p class="subheader_header">회원정보</p>
	   		<div style="float:left; margin-left:15%;">
	   		<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp"></c:import>
	   		</div>
	   	</div>
	   	<table class="tablebts">
	   		<tr>
	   			<td>기존 주소</td>
	   			<td><input type="text" class="form-control" placeholder="서울 서초구 00동 아이파크아파트 103동205호"  style="width:100%;"/></td>
	   		</tr>
	   		<tr>
				<th class="share">새 주소 입력</th>
					<td>
						<div class="input-group">
    							<input type="text" class="form-control" placeholder="물품검색" aria-label="Input group example" aria-describedby="btnGroupAddon">
    							<button class="input-group-text" id="btnGroupAddon" >검색</button>   						    
  						</div>
					</td>
				</tr>
	   		<tr>
	   			<td><button type="button" class="btn btn-primary btn-sm"id="btn-modify-success" style="margin-left:50%; margin-top:5%; width:80%;">확인</button></td>
	   		</tr>
	   	</table>
</div>

</body>
</html>