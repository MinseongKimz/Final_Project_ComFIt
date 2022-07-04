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
	var msg = "${msg}";
	var url = "<c:out value='${url}'/>";
	alert(msg);
	location.href = url;
</script>



</head>
<body>
</body>
</html>