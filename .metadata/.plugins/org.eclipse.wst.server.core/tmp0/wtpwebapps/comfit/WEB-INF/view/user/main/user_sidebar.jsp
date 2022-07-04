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
<title>사이드바</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
	
</style>
</head>
<body>
		<div class="btn-group-vertical" role="group" aria-label="Basic outlined example">
  			<button type="button" class="btn btn-outline-primary" onclick="location.href='user_information.action'">회원정보</button>
  			<button type="button" class="btn btn-outline-primary" onclick="location.href='user_buylist.action'">구매내역</button>
  			<button type="button" class="btn btn-outline-primary" onclick="location.href='user_selllist.action'">판매내역</button>
  			<button type="button" class="btn btn-outline-primary" onclick="location.href='user_moneylist.action'">입출금내역</button>
  			<button type="button" class="btn btn-outline-primary" onclick="location.href='user_drop.action'">회원탈퇴</button>
		</div>
	
</body>
</html>