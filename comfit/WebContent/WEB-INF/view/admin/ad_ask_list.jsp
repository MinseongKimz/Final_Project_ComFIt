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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 디자인 담당 -->
<title>ad_userbanned_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	
	<div style="margin-bottom: 20px;"><h1><b>관리자 모드_문의사항</b></h1></div>
	
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; box-shadow: 0 1px 3px 0 rgba(0,0,0,0.20);">
			<thead style="background-color: #f9fafd"><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: ; text-align: center;">회원 ID</th>
					<th style="background-color: ; text-align: center;">문의 제목</th>
					<th style="background-color: ; text-align: center;">접수시간</th>
					<th style="background-color: ; text-align: center;">처리 여부</th>
					<th style="background-color: ; text-align: center;">처리 시간</th>
				</tr>
			</thead>
			<tbody style="background: white;">
			<c:forEach var="ask" items="${adminAskList }">
				<tr onClick="location.href='ad_ask_list_reply.action'" style="">
					<td>${ask.u_id }</td>
					<td>${ask.ask_title }</td>
					<td>${ask.ask_date }</td>
					<td>${ask.ask_status }</td>
					<td>${ask.answer_date }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>


</body>
</html>