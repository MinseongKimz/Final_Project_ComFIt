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
<title>입출금내역</title>
<link rel="stylesheet" href="css/main.css" type="text/css">

<style type="text/css">

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
.ibgum{
	color: #0080FF;
	font-weight: bold;
}
.chulgum
{
	color: red;
	font-weight: bold;
}
</style>


</head>
<body>

<div>
	<div>
		<!-- 헤더 영역 -->
		<c:import url="comfit_header_user.jsp"></c:import>
	</div>

	<div class="title">
		마이페이지 &nbsp;&nbsp;<span style="font-size: 20pt;">포인트 입출금 내역</span>
		<br><br>
	</div>
	
	<div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-1" style="margin-left: 3%;">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">회원정보</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">구매내역</a>
					<br /> <a href="#"
						class="list-group-item list-group-item-action ">판매내역</a> <br />
					<a href="#" class="list-group-item list-group-item-action active" >입출금내역</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
				</div>
			</div>

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 5%; width: 60%;">
				<div class="d-flex justify-content-between">
					<p style="font-size: 18pt; font-weight: bolder;">보유 금액 : <span class="ibgum" style="font-size: 18pt;">40,000P</span></p>
					<select class="selectpicker" style="width: 100px; text-align: center; height: 30px;">
						<option>날짜순</option>
						<option>입금</option>
						<option>출금</option>
					</select>
				</div>
				
				<!-- 테이블  -->
				<div >
					<table class="table table-bordered" style="font-size: 10pt; width: 100%;">
						<thead>
							<tr>
								<th>날짜</th>
								<th>금액</th>
								<th>방식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2022-05-17</td>
								<td class="ibgum">+40,000</td>
								<td>입금</td>
							</tr>
							<tr>
								<td>2022-05-02</td>
								<td class="chulgum">-40,000</td>
								<td>출금</td>
							</tr>
							<tr>
								<td>2022-05-01</td>
								<td class="ibgum">+40,000</td>
								<td>입금</td>
							</tr>
							<tr>
								<td>2022-04-19</td>
								<td class="chulgum">-40,000</td>
								<td>출금</td>
							</tr>
							<tr>
								<td>2022-04-17</td>
								<td class="ibgum">+40,000</td>
								<td>입금</td>
							</tr>
						</tbody>
					</table>
					
					<div class="d-flex justify-content-end" >
						<button class="btn btn-primary btn-lg">입금</button> 
						&nbsp;
						<button class="btn btn-secondary btn-lg">출금</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>


</div>



</body>
</html>