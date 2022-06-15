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
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<style type="text/css">

	.subheader
	{
		font-size: 28pt;
		font-weight: bold;
	}
	.inout_point,.table,.able
	{
		font-size: 15pt;
		font-weight: bold;
	}
	.neyuk
	{
		font-size: 10pt;
		font-weight: bold;
		color: #0080FF;
	}
	.tablebts
	{
		width:40%;
		margin-left:40%;
		border-radius:5px;
		table-layout:fixed;
    	font-weight: bold;
    	background-color: #D3D3D3;
	}
	.user_image
	{
		width: 100px;
		height: 100px;
	}
	.fs-3
	{
		font-weight: bold;
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
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// alert("페이지 열림");
		$("#infoBtn").click(function()
		{
			// alert("내정보보기,수정");
			var inputpw = prompt("비밀번호를 입력해주세요.");
			
			alert("입력한 비밀번호 : " + inputpw);
			
			location.href= "user_information.action";
		});
		
	});
	
</script>
</head>
<body>

<!--Sidebar-->
<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">
	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>

<!--Header  -->
<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>

<div class="container">
   	<div style="text-align: center;">
   		<p class="subheader">마이페이지</p>
   	</div>
	<div style="text-align: center;">
		<div class="shadow p-3 mb-5 bg-body rounded" style="width: 80%; display: inline-block; text-align: left;">
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%; padding-left:15%;">
						<div class="user_image">	
							<img alt="경로에 해당사진없음!" src="${myInfo.u_profile }"
							style="object-fit:cover; height: 100%; width: 100%;">
						</div>
					</td>
				
					<th>
						<p style="padding-left:30%; font-size: 15pt;">${myInfo.u_nickname }
						<span style="color: green; font-size: 10pt;">LV ${level }</span><br>
						내 포인트 : <span style="color: #3CAEFF; font-size: 18pt">${point }</span></p>
					</th>
					<td>
						<button type="button" class="btn btn-primary" onclick="location.href='user_wish.action'">찜한상품보기</button>
						<button id="infoBtn" type="button" class="btn btn-primary">내 정보 보기/수정</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
			
	<div>
		<p class="fs-3">내 입출금내역</p> 
		<p class="neyuk">최근 입/출금</p>
		<table class="table table-bordered" style="width: 100%;">
		    <thead>
		        <tr class="table-primary">
		            <th style="width: 40%;">일시</th>
		            <th style="width: 30%;">포인트</th>
		            <th>방식</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="money" items="${myMoneyList }" begin="0" end="3">
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
		
		<!-- button -->
		<div style="text-align: right;">
		<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 20%; height: 40px; font-size: 15pt;"
		onclick="location.href='user_moneylist.action'">입출금 내역 전체보기</button>
		</div>
		
		<p class="fs-3">내 판매</p> 
		<p class="neyuk">최근 판매내역</p>
		<table class="table table-bordered table-hover" style="width: 100%;">
		    <thead>
		        <tr class="table-primary">
		            <th style="width: 25%;">낙찰일/채택일</th>
		            <th style="width: 15%;">최고가/낙찰가</th>
		            <th style="width: 30%;">상품정보</th>
		            <th style="width: 15%;">방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="sell" items="${sellList }" 
		    	begin="0" end="3">
		        <tr onclick="alert('해당 상품 페이지로');">
		            <td>${sell.comp_date }</td>
		            <td>${sell.pd_price }</td>
		            <td>${sell.pd_title }</td>
		            <td>${sell.system }</td>
		            <td>${sell.status }</td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		<!-- button -->
		<div style="text-align: right;">
		<button type="button" class="btn btn-primary btn-sm" id="sellBtn" style="width: 20%; height: 40px; font-size: 15pt;"
			    onclick="location.href='user_selllist.action'">판매내역 자세히보기</button>
		</div>      
		
		<div>
		<p class="fs-3">내 구매</p> 
		<p class="neyuk">최근 구매내역</p>
		<table class="table table-bordered table-hover" style="width: 100%;">
		    <thead>
		        <tr class="table-primary">
		            <th style="width: 25%;">낙찰일/채택일</th>
		            <th style="width: 15%;">금액</th>
		            <th style="width: 30%;">상품정보</th>
		            <th style="width: 15%;">방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="buy" items="${buyList }" 
		    	begin="0" end="3">
		        <tr onclick="alert('해당 상품 페이지로');">
		            <td>${buy.comp_date }</td>
		            <td>${buy.pd_price }</td>
		            <td>${buy.pd_title }</td>
		            <td>${buy.system }</td>
		            <td>${buy.status }</td>
		        </tr>
		        </c:forEach>
		        <!-- <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선마우스</td>
		            <td>배송(경매)</td>
		            <td>낙찰
		            	<button type="button" class="btn btn-primary btn-sm" id="buyBtn" style="width: 60px; height: 30px; font-size: 6pt;">구매확정</button>
		            </td>
		        </tr> -->     
		    </tbody>
		</table>
		<div style="text-align: right;">
		<button type="button" class="btn btn-primary btn-sm"id="buyBtn" style="width: 20%; height: 40px; font-size: 15pt;"
		        onclick="location.href='user_buylist.action'" >구매내역 자세히보기</button>
		</div>
			</div>
		</div>
</div>
</body>
</html>