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

<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
			<form action="loginAction.jsp" method="post">
				<h3 style="text-align: center">탈퇴 회원 정보 검색</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이메일을 입력하세요" name="userId" maxlength="20"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="전화번호를 입력하세요" name="userPassword" maxlength="20"/>
				</div>
				<input type="submit" class="btn btn-primary form-control" value="검색" />
			</form>
		</div>
	</div>
</div>


</body>
</html>