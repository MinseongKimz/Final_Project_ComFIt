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
<!-- 디자인 담당 -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<style>
</style>
</head>
<body>
<div id="page-wrapper">
	<div>
		<c:import url="Sidebar2.jsp"></c:import>
	</div>
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1>간단한 사이드바</h1>
      <p>메뉴가 많아서 한 페이지를 넘으면 세로 스크롤바 생김</p>
    </div>
  </div>
  <!-- /본문 -->
  
</div>
</body>
</html>
