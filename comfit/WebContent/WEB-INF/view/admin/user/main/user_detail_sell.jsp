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
<title>판매자 상세정보페이지</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<style type="text/css">
	ul li
	{
		list-style-type: none; 
		float: left;
		margin-left: 20px;
	}
	th .fs-4
	{
		text-align: right;
	}
	
</style>
</head>
<body>

<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>

<div class="container">
	<p class="fs-2" style="font-weight: bold; text-align: center;">판매자 정보</p>
	
	<!-- 판매자 정보를 나타내는 div -->
	<div class="seller" style="margin-top: 5%; padding-left: 10%;">
		<div class="product_image col-md-6" style="float: left; width: 270px; height: 210px;">	
			<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png" alt="이미지가 없습니다."
			style="width: 100%; height:100%; object-fit: cover;">
		</div>
		
		<table class="col-md-5" >
			<tr>
				<th style="text-align: left;"><p class="fs-4">닉네임 : </p>
				</th>
				<td>
				<p class="fs-6"> 아몰랑</p>
				</td>
			</tr>
			<tr>
				<th style="text-align: left;"><p class="fs-4">Level : </p>
				</th>
				<td>
				<p class="fs-6"> 5</p>
				</td>
			</tr>
			<tr>
				<th style="text-align: left;"><p class="fs-4">누적판매 수 : </p>
				</th>
				<td>
				<p class="fs-6"> 25회</p>
				</td>
			</tr>
			<tr>
				<th style="text-align: left;"><p class="fs-4">가입일 : </p>
				</th>
				<td>
				<p class="fs-6"> 2022. 05. 20</p>
				</td>
			</tr>

		</table>
	</div>
	<br>
	<p class="fs-4" style="font-weight: bold;">아몰랑 님으로부터 거래한 사람들의 후기</p>
	
	<!-- 해시태그 div -->
	<div class="hashtag" style="width: 100%;">
		<div style="float:left; text-align: left;">
		<ul>
			<!-- 해시태그 리스트 -->
			<li><span style="font-size:16pt; color: #5AE0FF;">#깔끔</span></li>
			<li><span style="font-size:16pt; color: #5AE0FF;">#신뢰</span></li>
			<li><span style="font-size:16pt; color: #5AE0FF;">#그카전문</span></li>
			<li><span style="font-size:16pt; color: #5AE0FF;">#신속정확</span></li>
		</ul>
		</div>
		
		<div style="text-align: right; height: 30px;">
		</div>
		
	</div>
	<br>
	
	<p class="fs-4" style="font-weight: bold;">판매내역</p>
	<!-- 후기 리스트 div -->
	<div>
		<table class="table table-striped-columns">
			<tr class="table-secondary">
				<th style="color: blue;">판매내역</th>
				<th>번호</th>
				<th>카테고리</th>
				<th>방식</th>
				<th>구매자</th>
				<th>일시</th>
			</tr>
			<tr>
				<td style="color: blue;">완료</td>
				<td>1</td>
				<td>그래픽카드</td>
				<td>배송</td>
				<td>김브이</td>
				<td>2022-05-21</td>
			</tr>
			<tr>
				<td style="color: blue;">완료</td>
				<td>2</td>
				<td>그래픽카드</td>
				<td>배송</td>
				<td>박브이</td>
				<td>2022-05-22</td>
			</tr>
			<tr>
				<td style="color: blue;">완료</td>
				<td>3</td>
				<td>그래픽카드</td>
				<td>배송</td>
				<td>이브이</td>
				<td>2022-05-23</td>
			</tr>
		</table>
	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
</div>

<div class="footer">

</div>

</body>
</html>