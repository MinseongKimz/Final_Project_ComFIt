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
<title>회원가입</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>

<div>
	<form action="">
		<table>
			<tr>
				<td>이름 : <input type="text" id=name name=name> </td>
			</tr>
			<tr>
				<td>닉네임 : <input type="text" id=nickname name=nickname> </td>
			</tr>
			<tr>
				<td>휴대폰번호 : <input type="text" id=tel name=tel> </td>
			</tr>
			
		</table>
	</form>
</div>

</body>
</html>