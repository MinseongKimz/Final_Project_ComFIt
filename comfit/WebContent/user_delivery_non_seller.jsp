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
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>배송 판매자_미입찰</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<style type="text/css">
p
{
	font-size: 9pt;
}
/* 내용 div */
.content
{
	padding: 4%;
}
/* 내용 안에 들어가는 p */
.content_text
{
	font-size: 15pt; 
	font-weight: bold; 
	line-height: 50%;
}
/* 아래 입찰정보 출력단 */
.content_bid
{
	padding: 4%;
}
</style>

</head>
<body>

<div class="header">
	<c:import url="comfit_header_user.jsp"></c:import>
</div>

<div class="container">
	<div style="padding-top: 5%;">
	
			<p class="fs-4" style="text-align: center; font-weight: bold;">[카테고리]2022 GTX 0000 아주 합리적인 가격에 드립니다.</p>
		
		<div class="content">
		<div class="product_image col-md-6" style="float: left; width: 530px; height: 400px; margin-right: 3%;">	
			<img src="https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196__340.jpg" class="img-thumbnail" alt="이미지가 없습니다."
			style="width: 100%; height:100%; object-fit: cover;">
		</div>
		
		<table class="col-md-5">
			<tr>
				<td colspan="2"><p>거래방식</p>
				<p class="content_text">배송(경매)</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>시작가격</p>
				<p class="content_text">100,000 원</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>현재가격</p>
				<p class="content_text" style="color: blue;">100,000 원</p></td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료까지</p>
				<p class="content_text" style="font-size: 20pt;">[<span style="color: #ffd700;">08:51:37</span>]</p>
				</td>
			</tr>
			<tr>
				<td style="padding-top: 10px;">
					<p>제조사/물품명</p>
				</td>
				<th style="padding-top: 10px;">
					<p style="font-weight: bold;">제조사/물품명</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>즉시구매가격</p>
				</td>
				<th>
					<p>143,200원</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>Comfit 추천가격</p>
				</td>
				<th>
					<p>189,200원</p>
				</th>
			</tr>
			
			<tr>
				<td colspan="2">
				<button type="button" class="btn btn-primary" style="width: 48%;">수정하기</button>
				<button type="button" class="btn btn-secondary" style="width: 48%;">삭제하기</button>
				</td>
			</tr>
		</table>
		</div>
		
		<div class="content" style="height: 300px;">
		<table class="col-md-6" style="float: left;">
			<tr class="table-secondary">
				<th style="height:25px; width: 75%; text-align: center;">
				<p style="font-size: 18pt;">상품 상세정보</p>
				</th>
			</tr>
			
			<!-- 공간분리용 tr -->
			<tr style="height: 10px;">
				<th>
				</th>
			</tr>
			
			<tr class="table-secondary">
				<td style="padding:5%;">
				<p>상품 상세정보<br><br>
				1. 제조사 A/S 가능여부 : 무상 5개월까지 가능<br><br>
				2. 특이사항 : 외관상 흠집 및 오염 없음, 작동상태 양호, 사용기간 3개월
				</p>
				</td>
			</tr>
		</table>
		
		<button class="btn btn-primary" style="margin-left: 3%;">목록으로</button>
		</div>
		
		<div class="content_bid">
			<table>
			<tr>
				<th>
					<p class="content_text">현재 입찰 정보</p>
				</th>
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
</div>



</body>
</html>