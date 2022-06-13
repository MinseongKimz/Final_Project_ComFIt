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
<title>회원 탈퇴</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
*{
	font-family: 맑은 고딕;
}

.list-group {
	width: 120px;
	text-align: center;
}

.title {
	margin-left: 11%;
	font-family: 맑은 고딕;
	font-size: 30pt;
}


.list-group-item {
	text-align: center;
	font-weight: bold;
}
.container
{
	margin-left: 5%;
}
h5
{
	font-weight: bold;
}
#err
{
	font-size: 10pt;
	color: red;
	display: none;
}
</style>

</head>
<body>
<div>
		<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	   	</div>
	   	
	
	<div>
		<div class="row">
				<div style="float:left; margin-left:15%;">
								<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
				</div>	

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 4%;">
				<div class="d-flex justify-content-between">
					<p style="font-size: 18pt; font-weight: bolder;">회원 탈퇴</p>
				</div>
				
				<div class="dropdown">
					<h3 style="font-family: 맑은 고딕; font-weight: bold;">정말로 <span style="color: #0080FF;">comfit</span>을 탈퇴하시겠습니까?</h3>
					<br /><br />
					<h4 style="font-weight: bold;">탈퇴를 원하신다면 비밀번호를 입력해 주세요.</h4>
					<br />
					<form action="">
						<input type="text" class="form-control" style="width: 20%;" id="pw" placeholder="비밀번호 입력">
						<br />
						<input type="button" class="btn btn-primary" value="확인" style="width: 100px;">	
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-secondary" value="취소" style="width: 100px;">	
					</form>
					<br />
					<span id="err">입력 정보가 올바르지 않습니다.</span>
				</div>				
			</div>
		</div>
	</div>
</div>
	
	
</body>
</html>