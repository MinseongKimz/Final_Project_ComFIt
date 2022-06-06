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
		font-size: 25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:5%;
	}
	.logo
	{
		margin-left: 15%;
		margin-bottom:12%;
	}
	.testbox
	{
		margin-left:5%;
		margin-top:3%;
	}
	.inout_point,.table,.able
	{
		font-size: 15pt;
		font-weight: bold;
		margin-left: 25%;
	}
	.all_list
	{
		margin-left:77%;
	}
	.neyuk
	{
		font-size: 10pt;
		font-weight: bold;
		margin-left: 30%;
		color: #0080FF;
	}
	.btn-primary
	{
		margin-left:37%;
		border-radius:5px;
	}
	.able
</style>
</head>
<body>

<div>
	<!--Header  -->
	<div class="header">
      <c:import url="comfit_header.jsp"></c:import>
   	</div>
   	
   	<div>
   		<p class="subheader">마이페이지</p>
   		<table class="able">
			<tbody>
				<tr>
					<th>test</th>
				</tr>
			</tbody>
		</table>
   	</div>
   	
	<div>
		<img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;" class="logo">
	</div>
	
	 <div class="content" >
		<h3 class="inout_point">입출금 내역 내 포인트 : test p</h3> <a href="" class="all_list" style="margin-bottom: 5%;">전체보기</a>
		<table class="table" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>날짜</th>
		            <th>포인트</th>
		            <th>방식</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-17</td>
		            <td>80,000</td>
		            <td>입금</td>
		        </tr>     
		        <tr>
		            <td>2022-05-20</td>
		            <td>-50,000</td>
		            <td>입금</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		
		
		
		<div class="content" >
		<h3 class="inout_point">내 판매</h3> <p class="neyuk">1개월 간 내역</p>
		<table class="table" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>낙찰일/채택일</th>
		            <th>최고가/낙찰가</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-20</td>
		            <td>169,000</td>
		            <td>GTX 1060 이엠텍</td>
		            <td>경매</td>
		            <td>경매중</td>
		        </tr>     
		        <tr>
		            <td>2022-05-13</td>
		            <td>50,000</td>
		            <td>HP 모니터</td>
		            <td>제안 거래</td>
		            <td>거래 종료</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 400px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		           
		
		<div class="content" >
		<h3 class="inout_point">내 구매</h3> <p class="neyuk">1개월 간 내역</p>
		<table class="table" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>낙찰일/채택일</th>
		            <th>금액</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선마우스</td>
		            <td>배송(경매)</td>
		            <td>낙찰
		            	<button type="button" class="btn btn-primary btn-sm" id="buyBtn" style="width: 60px; height: 30px; font-size: 6pt;">구매확정</button>
		            </td>
		        </tr>     
		        <tr>
		            <td>2022-04-30</td>
		            <td>80,000</td>
		            <td>커세어 무선헤드셋</td>
		            <td>직거래(구매제안)</td>
		            <td>거래 종료</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		<button type="button" class="btn btn-primary btn-sm"id="buyBtn" style="width: 400px; height: 40px; font-size: 15pt;">구매내역 자세히보기</button>
		
			</div>
		</div>
	</div>
</div>
</body>
</html>