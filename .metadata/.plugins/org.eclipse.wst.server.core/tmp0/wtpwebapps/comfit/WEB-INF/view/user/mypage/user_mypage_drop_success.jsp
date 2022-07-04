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
<title>회원 탈퇴 완료</title>
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
#mainBtn
{
	margin-left: 5%;
	width: 300px;
}
</style>

</head>
<body>
<div>
	<div>
		<!-- 헤더 영역 -->
		<c:import url="admin/comfit_header_user.jsp"></c:import>
	</div>
	
	<div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-1" style="margin-left: 3%;">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">회원정보</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">구매내역</a>
					<br /> <a href="#"
						class="list-group-item list-group-item-action">판매내역</a> <br />
					<a href="#" class="list-group-item list-group-item-action">입출금내역</a>
					<br /> <a href="#" class="list-group-item list-group-item-action active">회원탈퇴</a>
				</div>
			</div>

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 4%;">
				<div class="d-flex justify-content-between">
					<p style="font-size: 18pt; font-weight: bolder;">회원 탈퇴</p>
				</div>
				<br />
				<div class="dropdown">
					<h3 style="font-weight: bold;">탈퇴 신청이 완료되었습니다.</h3>
					<br /><br />
					<h4 style="font-weight: bold;">6개월 후 회원 정보가 완전히 삭제됩니다.</h4>
					<h4 style="font-weight: bold;">이용해주셔서 감사합니다.</h4>
					<h4 style="font-weight: bold;"><span style="color: #0080FF;">Comfit</span>은 고객님의 앞날을 응원합니다.</h4>
					<br />
					
					<button class="btn btn-primary" id="mainBtn">
						메인으로 돌아가기
					</button>
				</div>				
			</div>
		</div>
	</div>
</div>
	
	
</body>
</html>