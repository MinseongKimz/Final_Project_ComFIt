<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 기기별 크기 담당 -->
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>ad_userout_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		//alert("테스트");
		
		$(".userout").change(function()
		{
			//alert("차단");
			alert($(".userout").val());
			
			//데이터가 admin_userlist.action 로 이동되어야 함
			$(location).attr('href', '/admin_userlist.action');
		})
	});		

</script>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>탈퇴 회원 리스트</b></h1></div> 
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; box-shadow: 0 1px 3px 0 rgba(0,0,0,0.20);">
			<thead style="background-color: #f9fafd"><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #; text-align: center;">E-mail</th>
					<th style="background-color: #; text-align: center;">이름</th>
					<th style="background-color: #; text-align: center;">닉네임</th>
					<th style="background-color: #; text-align: center;">탈퇴일</th>
					<th style="background-color: #; text-align: center;">탈퇴장소(IP)</th>
					<th style="background-color: #; text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody style="background-color: white;">
			
			<c:forEach var="user" items="${useroutList }">
				<tr>
					<td>${user.u_email }</td>
					<td>${user.u_name }</td>
					<td>${user.u_nickname }</td>
					<td>${user.u_exitdate }</td>
					<td>211.100.015....	</td>
					<td>
						<select class="form-select userout" style="width: 70%; text-align: ;">
						    <option selected value="userout">탈퇴</option>
						    <option value="userlist">복구</option>
						</select>				
					</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>



	</div>
</div>


</body>
</html>