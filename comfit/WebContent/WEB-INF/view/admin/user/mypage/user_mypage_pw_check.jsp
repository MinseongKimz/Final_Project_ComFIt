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
<title>마이페이지 PW찾기</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	.btns
	{
		width: 100px;
	}

</style>
</head>
<body>

<div class="header">
      <c:import url="admin/comfit_header_user.jsp"></c:import>
   	</div>

<div class="container" style="margin-top: 8%;">
	<div style="text-align: center;">
		<p class="pwcheck"><span style="font-weight: bold; font-size: 20pt;">비밀번호 확인</span></p>
		<p class="check">현재 사용하고 계시는 비밀번호를 입력해주세요.</p>
		<input type="text" class="pwinsert" placeholder="비밀번호를 입력해주세요"/>
		<input type="text" class="errMsg" placeholder="입력하신 비밀번호가 일치하지 않습니다. 다시 입력해주세요" style="color:red; display: none;"/>
	<br /><br />
		<div>
			<button type="button" class="btn btn-primary btns">확인</button>
			<button type="button" class="btn btn-primary btns" onclick="location.href='user_mypage_info.jsp'">취소</button>
		</div>
	</div>
</div>
</body>
</html>