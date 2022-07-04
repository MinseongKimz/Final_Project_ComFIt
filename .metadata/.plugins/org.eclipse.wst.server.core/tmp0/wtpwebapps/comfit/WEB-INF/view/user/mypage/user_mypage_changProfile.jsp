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
<title>프로필 변경하기</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
	*{
		font-size: 18pt;
		font-family: 맑은 고딕;
		
	}
	form
	{
		margin-left: 5%;
	}
	
</style>

</head>
<body>

<form action="changProfile.jsp" method="post" id="imgform" enctype="multipart/form-data">
	<br /><br /><br /><br />
	<input type="hidden" name="u_id" id="u_id" value="${u_id }" />
	<input type="file" name="uploadFile" id="uploadFile" required="required"/>
	<br /><br /><br />
	<button type="submit">변경하기</button>
</form>

</body>
</html>