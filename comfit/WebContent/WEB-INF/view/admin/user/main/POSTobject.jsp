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
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" type="text/css">

<script type="text/javascript">
	window.onload(function()
	{
		$("#mainForm").submit();
	})
</script>



</head>
<body>

<form action="user_mainlist.action" method="post" id="mainForm">
</form>
</body>
</html>