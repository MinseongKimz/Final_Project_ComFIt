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
	<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	</div>
	   	

	<div class="title">
		마이페이지 &nbsp;&nbsp;<span style="font-size: 20pt;">포인트 입출금 내역</span>
		<br><br>
	</div>
	
	<div>
		<div class="row">
			<div style="float:left; margin-left:15%;">
								<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
				</div>	

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 5%; width: 60%;">
				<div class="d-flex justify-content-between">
					<p style="font-size: 18pt; font-weight: bolder;">보유 금액 : <span class="ibgum" style="font-size: 18pt;">${point }P</span></p>
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
								<th>일시</th>
								<th>금액</th>
								<th>방식</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="money" items="${myMoneyList }">
							<tr>
								<td>${money.m_date }</td>
								<c:if test="${money.inout eq '입금'}">
									<td class="ibgum">+${money.m_money }</td>
									<td class="ibgum">입금</td>
								</c:if>
								<c:if test="${money.inout eq '출금'}">
									<td class="chulgum">-${money.m_money }</td>
									<td class="chulgum">출금</td>
								</c:if>
							</tr>
							</c:forEach>
							<!-- <tr>
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
							</tr> -->
						</tbody>
					</table>
					
					<div class="d-flex justify-content-end" >
						<button class="btn btn-primary btn-lg" onclick="location.href='inputmoneyform.action'">입금</button> 
						&nbsp;
						<button class="btn btn-secondary btn-lg" onclick="location.href='outputmoneyform.action'">출금</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>


</div>



</body>
</html>