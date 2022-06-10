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
<style type="text/css">

	
</style>
</head>
<body>


		
		<div class="btn-group-vertical" role="group" aria-label="Basic outlined example">
  			<button type="button" class="btn btn-outline-primary">회원정보</button>
  			<button type="button" class="btn btn-outline-primary">구매내역</button>
  			<button type="button" class="btn btn-outline-primary">판매내역</button>
  			<button type="button" class="btn btn-outline-primary">입출금내역</button>
  			<button type="button" class="btn btn-outline-primary">회원탈퇴</button>
		</div>
		
		
	
</body>
</html>