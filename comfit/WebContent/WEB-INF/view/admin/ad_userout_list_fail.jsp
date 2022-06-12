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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 게시판 웹 사이트</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div style="margin-left: 250px">
<h1><b>탈퇴 회원 정보 검색</b></h1>
<p>검색한 회원이 존재하지 않습니다.</p>
<button type="button" class="btn btn-primary" onclick="location.href='ad_userout_search.jsp' ">돌아가기</button>
</div>



</body>
</html>