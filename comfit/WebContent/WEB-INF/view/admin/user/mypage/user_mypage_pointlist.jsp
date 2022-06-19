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
<title>입출금내역</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

	.title 
	{
		font-family: 맑은 고딕;
		font-size: 30pt;
	}
	.ibgum
	{
		color: #0080FF;
		font-weight: bold;
	}
	.chulgum
	{
		color: red;
		font-weight: bold;
	}

	table
	{
		font-weight: bold;
	}

	
</style>


</head>
<body>


<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">

	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>

<!-- header -->
<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>

<!--sidebar  -->


<div class="container">
	<div class="title" style="text-align: center; font-size: 28pt; font-weight: bold;">
		포인트 입출금 내역
		<br>
	</div>


	<div style="width: 100%;">
    	<div style="text-align: right;">
			<select class="selectpicker" style="width: 100px; height: 30px; float: right;" >
				<option>날짜순</option>
				<option>입금만</option>
				<option>출금만</option>

			</select>
		</div>

		<div class="d-flex justify-content-between">
			<p style="font-size: 18pt; font-weight: bolder;">보유 포인트 : 
				<span class="ibgum" style="font-size: 18pt;">${point }P</span>
			</p>
		</div>
		
		<!-- 테이블  -->
		<table class="table table-bordered" style="font-size: 10pt; width: 100%;">
			<thead>
				<tr class="table-primary">

					<th style="width: 40%;">일시</th>
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
			</tbody>
		</table>
		
		<div class="d-flex justify-content-end" >
			<button class="btn btn-primary btn-lg" onclick="location.href='inputmoneyform.action'">입금하기</button> 
			&nbsp;
			<button class="btn btn-secondary btn-lg" onclick="location.href='outputmoneyform.action'">출금하기</button>
		</div>
	</div>
</div>



</body>
</html>